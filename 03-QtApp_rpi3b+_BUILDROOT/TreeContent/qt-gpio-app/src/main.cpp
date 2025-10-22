#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "controller.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Controller controller;
    engine.rootContext()->setContextProperty("controller", &controller);

    // Load QML file from the correct path
    engine.load(QUrl::fromLocalFile("/usr/share/qt-gpio-app/main.qml"));  

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

