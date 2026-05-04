#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQuickStyle>

int main(int argc, char *argv[])
{
    QQuickStyle::setStyle("Basic");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/src/UI/Main.qml"));

    if (engine.rootObjects().isEmpty()) {
        qDebug() << "Failed to load QML module!";
        return -1;
    }

    return app.exec();
}