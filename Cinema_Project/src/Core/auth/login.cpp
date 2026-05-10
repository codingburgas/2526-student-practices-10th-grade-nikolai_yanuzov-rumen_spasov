#include "login.hpp"




LogerController::LogerController(QObject *parent):QObject(parent)
{

}

void LogerController::validate(const QString &user, const QString &password) {
    qDebug() << "Submit pressed!";
    qDebug() << "Email:" << user;
    qDebug() << "Password:" << password;

    // ===== BASIC VALIDATION =====
    if (user.isEmpty() || password.isEmpty()) {
        emit loginError("Fields cannot be empty", "");
        return;
    }

    // ===== DATABASE CHECK =====
    QSqlQuery query;
    query.prepare("SELECT userPassword FROM Users WHERE userEmail = :user OR userName = :user");
    query.bindValue(":user", user);

    if (!query.exec()) {
        qDebug() << "Query failed:" << query.lastError();
        emit loginError("Database error", "");
        return;
    }

    // ===== user NOT FOUND =====
    if (!query.next()) {
        emit loginError("No such user", "");
        return;
    }

    // ===== PASSWORD CHECK =====
    QString dbPassword = query.value(0).toString();

    if (dbPassword != password) {
        emit loginError("", "Wrong password");
        return;
    }

    // ===== SUCCESS =====
    emit loginSuccess();
}

