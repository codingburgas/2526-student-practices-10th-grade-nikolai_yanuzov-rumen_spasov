#ifndef LOGER_H
#define LOGER_H


#include <QString>
#include <QObject>
#include <QDebug>
class Loger : public QObject{
    Q_OBJECT

public:
    explicit Loger(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void onSubmitPressed(const QString &email, const QString &password);

private:
    bool PropperPass(QString& pass);

signals:
    void loginError(QString error);
    void loginSuccess();
};


#endif
