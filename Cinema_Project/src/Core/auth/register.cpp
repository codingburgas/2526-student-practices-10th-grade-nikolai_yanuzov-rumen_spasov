#include "register.hpp"


RegisterController::RegisterController(QObject *parent) : QObject(parent) {
    LoadSql();
}

void RegisterController::validate(const QString& username,
                                  const QString& email,
                                  const QString& password,
                                  const QString& passwordConfirm)
{
    // ===== ERROR FLAGS =====
    QString usernameError;
    QString emailError;
    QString passwordError;

    {
    QStringList existingUsernames;

    QSqlQuery userQuery;
    if (!userQuery.exec("SELECT userName FROM Users")) {
        qDebug() << "Query failed:" << userQuery.lastError();
    }
    else {
        while (userQuery.next()) {
            QString name = userQuery.value(0).toString();
            existingUsernames.append(name);
        }
    }
    // ===== USERNAME CHECK =====
    if (username.isEmpty()) {
        usernameError = "Username cannot be empty";
    }
    else if (username.length() < 3) {
        usernameError = "Username too short";
    }
    else if (existingUsernames.contains(username)) {
        usernameError = "Username already exists";
    }
    }

    {
        QStringList existingEmails;

        QSqlQuery userQuery;
        if (!userQuery.exec("SELECT userEmail FROM Users")) {
            qDebug() << "Query failed:" << userQuery.lastError();
        }
        else {
            while (userQuery.next()) {
                QString name = userQuery.value(0).toString();
                existingEmails.append(name);
            }
        }
        // ===== EMAIL CHECK =====
        QRegularExpression emailRegex(R"(^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$)");
        if (email.isEmpty()) {
            emailError = "Email cannot be empty";
        }
        else if (!emailRegex.match(email).hasMatch()) {
            emailError = "Invalid email format";
        }
        else if (existingEmails.contains(email)) {
            emailError = "Email already exists";
        }
    }

    // ===== PASSWORD CHECK =====
    if (password.isEmpty()) {
        passwordError = "Password cannot be empty";
    }
    else if (password.length() < 4) {
        passwordError = "Password too short";
    }
    else if (password != passwordConfirm) {
        passwordError = "Passwords do not match";
    }

    // ===== RESULT =====
    if (!usernameError.isEmpty() ||
        !emailError.isEmpty() ||
        !passwordError.isEmpty())
    {
        emit registerError(usernameError, emailError, passwordError);
        return;
    }

    {
        QSqlQuery userQuery;
        userQuery.prepare(
            "INSERT INTO Users (userName, userEmail, userPassword) "
            "VALUES (:name, :email, :password)"
            );


        userQuery.bindValue(":name", username);
        userQuery.bindValue(":email", email);
        userQuery.bindValue(":password", password);


        if (!userQuery.exec()) {
            qDebug() << "INSERT error:" << userQuery.lastError().text();
            emit registerError("", "", "Database error");
            return;
        }
    }

    emit registerSuccess();
    qDebug() << "User registered successfully";
}

void RegisterController::LoadSql(){
    QFile file(":/sql/sql_assets/users.sql");

    if (!file.open(QIODevice::ReadOnly)) {
        qDebug() << "Cannot open SQL file:" << file.errorString();
        return;
    }

    QString sql = file.readAll();
    file.close();

    // Use a temporary query for table creation
    QSqlQuery createQuery;
    if (!createQuery.exec(sql)) {
        qDebug() << "CREATE TABLE error:" << createQuery.lastError().text();
    }
}