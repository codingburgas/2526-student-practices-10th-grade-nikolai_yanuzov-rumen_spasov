#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQuickStyle>
#include <QQmlContext>
#include "AppController.hpp"
#include <QFileInfo>

int main(int argc, char *argv[])
{
    QQuickStyle::setStyle("Basic");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    AppController con(&engine, &app);
    qDebug() << con.authCon->registeringCon;
    engine.rootContext()->setContextProperty("auth", con.authCon);

    // ADD THIS - Check if QRC file exists
    QFileInfo qrcFile(":/src/UI/Main.qml");
    qDebug() << "QRC file exists:" << qrcFile.exists();

    // ADD THIS - Check import paths
    qDebug() << "Import paths:" << engine.importPathList();

    // Connect to warnings/errors
    QObject::connect(&engine, &QQmlApplicationEngine::warnings,
                     [](const QList<QQmlError> &warnings) {
                         for (const auto &warning : warnings)
                             qDebug() << "QML Warning:" << warning.toString();
                     });

    engine.load(QUrl("qrc:/src/UI/Main.qml"));

    if (engine.rootObjects().isEmpty()) {
        qDebug() << "Failed to load QML module!";
        return -1;
    }

    return app.exec();
}