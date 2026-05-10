#include "authcontroller.h"
#include <QDir>


AuthController::AuthController(QObject* parent):QObject(parent){
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("cinema.db");
    if (!db.open()) {
        qDebug() << db.lastError();
    }
    LoadSql();
    registeringCon = new RegisterController(this);
    loginCon = new LogerController(this);
}


void AuthController::login(const QString &email, const QString &password)
{
    loginCon->validate(email, password);
}

void AuthController::registerUser(const QString& username, const QString &email, const QString &password, const QString &passwordConfirm)
{
    registeringCon->validate(username, email, password, passwordConfirm);
}


void AuthController::LoadSql(){
    QFile file(":/sql/sql_assets/users.sql");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Cannot open SQL file:" << file.errorString();
        return;
    }

    QString sqlContent = file.readAll();
    file.close();

    // Split into statements
    QStringList statements = sqlContent.split(';', Qt::SkipEmptyParts);

    QSqlQuery query;

    for (QString stmt : statements) {
        stmt = stmt.trimmed();

        if (!stmt.isEmpty()) {
            if (!query.exec(stmt)) {
                qDebug() << "SQL error:" << query.lastError().text();
                qDebug() << "Statement was:" << stmt;
            }
        }
    }
}