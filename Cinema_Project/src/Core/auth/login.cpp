#include "login.hpp"

#include <QSqlDatabase>
#include <QSqlError>
#include <QSqlQuery>

LogerController::LogerController(QObject *parent)
    : QObject(parent), admin(false)
{
}

void LogerController::validate(const QString &user, const QString &password)
{
    if (user.isEmpty() || password.isEmpty()) {
        emit loginError("Fields cannot be empty", "");
        return;
    }

    // Escape single quotes
    QString escapedUser = user;
    escapedUser.replace("'", "''");

    QSqlQuery query(QSqlDatabase::database());

    QString sql =
        QString("SELECT userPassword, admin "
                "FROM Users "
                "WHERE userEmail='%1' OR userName='%1'")
            .arg(escapedUser);

    qDebug() << sql;

    if (!query.exec(sql)) {
        qDebug() << query.lastError();
        emit loginError("Database error", "");
        return;
    }

    if (!query.next()) {
        emit loginError("No such user", "");
        return;
    }

    QString dbPassword = query.value(0).toString();

    if (dbPassword != password) {
        emit loginError("", "Wrong password");
        return;
    }

    admin = query.value(1).toBool();

    emit loginSuccess();
}