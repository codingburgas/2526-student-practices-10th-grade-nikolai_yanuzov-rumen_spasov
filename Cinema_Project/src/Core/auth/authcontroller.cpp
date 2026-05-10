#include "authcontroller.h"
#include <QDir>


AuthController::AuthController(QObject* parent):QObject(parent){
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("cinema.db");
    if (!db.open()) {
        qDebug() << db.lastError();
    }
    loginCon = new LogerController(this);
    registeringCon = new RegisterController(this);
}


void AuthController::login(const QString &email, const QString &password)
{
    loginCon->validate(email, password);
}

void AuthController::registerUser(const QString& username, const QString &email, const QString &password, const QString &passwordConfirm)
{
    registeringCon->validate(username, email, password, passwordConfirm);
}