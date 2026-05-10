#include "login.hpp"




LogerController::LogerController(QObject *parent):QObject(parent)
{

}

void LogerController::validate(const QString &email, const QString &password) {
    qDebug() << "Submit pressed!";
    qDebug() << "Email:" << email;
    qDebug() << "Password:" << password;

    // ===== BASIC VALIDATION =====
    if (email.isEmpty() || password.isEmpty()) {
        emit loginError("Fields cannot be empty", "");
        return;
    }

    // ===== DATABASE CHECK =====
    QSqlQuery query;
    query.prepare("SELECT userPassword FROM Users WHERE userEmail = :email");
    query.bindValue(":email", email);

    if (!query.exec()) {
        qDebug() << "Query failed:" << query.lastError();
        emit loginError("Database error", "");
        return;
    }

    // ===== EMAIL NOT FOUND =====
    if (!query.next()) {
        emit loginError("No such email", "");
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

