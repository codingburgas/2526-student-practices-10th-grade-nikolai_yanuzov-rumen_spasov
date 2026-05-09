#include "AppController.hpp"
AppController::AppController(QQmlApplicationEngine* engine, QObject *parent) : QObject(parent)
{
    authCon = new AuthController(this);
}
