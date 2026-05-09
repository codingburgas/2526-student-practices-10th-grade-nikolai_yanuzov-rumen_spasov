#ifndef LOGERCONTROLLER_H
#define LOGERCONTROLLER_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QMap>

class LogerController : public QObject
{
    Q_OBJECT

public:
    explicit LogerController(QObject *parent = nullptr);

    void validate(const QString &email, const QString &password);

signals:
    void loginSuccess();
    void loginError(QString emailError, QString passError);

private:
    bool properPass(const QString &pass);

    QMap<QString, QString> loginStorage;
};

#endif