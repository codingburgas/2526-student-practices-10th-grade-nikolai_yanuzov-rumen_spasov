#ifndef AUTHCONTROLLER_H
#define AUTHCONTROLLER_H

#include <QObject>
#include "register.hpp"
#include "login.hpp"
#include <QSqlDatabase>

class AuthController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(LogerController* loginCon MEMBER loginCon CONSTANT)
    Q_PROPERTY(RegisterController* registeringCon MEMBER registeringCon CONSTANT)
public:
    AuthController(QObject* parent = nullptr);


    Q_INVOKABLE void login(const QString &email, const QString &password);
    Q_INVOKABLE void registerUser(const QString& username, const QString &email, const QString &password, const QString &passwordConfirm);

    LogerController* loginCon;
    RegisterController* registeringCon;
private:
    QSqlDatabase db;
};

#endif // AUTHCONTROLLER_H
