#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQuickStyle>
#include <QQmlContext>
#include "../Core/auth/login.hpp"


int main(int argc, char *argv[])
{
    QQuickStyle::setStyle("Basic");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Loger loger(&app);
    engine.rootContext()->setContextProperty("loger", &loger);


    engine.load(QUrl("qrc:/src/UI/Main.qml"));

    if (engine.rootObjects().isEmpty()) {
        qDebug() << "Failed to load QML module!";
        return -1;
    }

    return app.exec();
}