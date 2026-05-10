#ifndef REGISTERCONTROLLER_H
#define REGISTERCONTROLLER_H


#include <QString>
#include <QObject>
#include <QDebug>
#include <QVector>
#include <QMap>
#include <QRegularExpression>
#include <QSqlQuery>
#include <QSqlError>
#include <QFile>
class RegisterController  : public QObject{
    Q_OBJECT

public:
    explicit RegisterController(QObject *parent = nullptr);

    void validate(const QString& username, const QString &email, const QString &password, const QString &passwordConfirm);
private:
    void LoadSql();

signals:
    void registerError(QString usernameError, QString emailError, QString passError);
    void registerSuccess();
};


#endif
