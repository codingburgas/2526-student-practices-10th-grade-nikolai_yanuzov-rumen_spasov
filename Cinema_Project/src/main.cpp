#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "backend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // 1. Регистрация на C++ класа
    qmlRegisterType<Backend>("Cinema_Proj", 1, 0, "Backend");

    QQmlApplicationEngine engine;

    // 2. Свързване на защитата (трябва да е ПРЕДИ зареждането)
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // 3. Еднократно зареждане на главния модул
    // Уверис URI в CMakeLists.txt (вероятно се, че името тук съвпада точно  Cinema_Proj)
    engine.loadFromModule("Cinema_Project", "Main");

    return QCoreApplication::exec();
}