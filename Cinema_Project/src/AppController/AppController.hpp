#ifndef APP_CON
#define APP_CON
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "../Core/auth/authcontroller.h"
class AppController : public QObject{
    Q_OBJECT
public:
    explicit AppController(QQmlApplicationEngine* engine, QObject* parent = nullptr);

    AuthController* authCon;

};


#endif