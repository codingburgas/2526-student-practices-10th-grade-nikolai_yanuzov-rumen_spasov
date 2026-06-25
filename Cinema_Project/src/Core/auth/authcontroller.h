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

    Q_PROPERTY(bool isAdmin READ getIsAdmin WRITE setIsAdmin NOTIFY isAdminChanged)

public:
    AuthController(QObject* parent = nullptr);

    // Q_PROPERTY getter/setter
    bool getIsAdmin() const { return m_isAdmin; }
    void setIsAdmin(bool value) {
        if (m_isAdmin == value) return;
        m_isAdmin = value;
        emit isAdminChanged();
    }

    Q_INVOKABLE void login(const QString &email, const QString &password);
    Q_INVOKABLE void registerUser(const QString& username, const QString &email,
                                  const QString &password, const QString &passwordConfirm,
                                  const bool admin);

    LogerController* loginCon;
    RegisterController* registeringCon;

signals:
    void isAdminChanged();

private:
    bool m_isAdmin = false;
    void LoadSql();
    QSqlDatabase db;
};

#endif // AUTHCONTROLLER_H
