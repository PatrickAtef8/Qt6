#include "controller.h"
#include <QDebug>
#include <QFile>
#include <QTextStream>

#define GPIO_PIN "529"  // Update this to your actual GPIO number

Controller::Controller(QObject *parent) : QObject(parent) {
    // Set GPIO path dynamically
    gpioPath = "/sys/class/gpio/gpio" GPIO_PIN "/";

    // Export GPIO pin if not already available
    QFile exportFile("/sys/class/gpio/export");
    if (!QFile(gpioPath + "direction").exists()) {
        writeToFile("/sys/class/gpio/export", GPIO_PIN);
    }

    // Set GPIO direction to output
    writeToFile(gpioPath + "direction", "out");
}

void Controller::toggleLED() {
    QFile valueFile(gpioPath + "value");

    if (valueFile.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream in(&valueFile);
        QString value = in.readLine().trimmed();
        valueFile.close();

        // Toggle LED state (if "1", set "0", otherwise set "1")
        writeToFile(gpioPath + "value", (value == "1") ? "0" : "1");
        qDebug() << "LED toggled! New state:" << ((value == "1") ? "OFF" : "ON");
    } else {
        qWarning() << "Failed to read GPIO value file!";
    }
}

void Controller::writeToFile(const QString &path, const QString &value) {
    QFile file(path);
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QTextStream out(&file);
        out << value;
        file.close();
    } else {
        qWarning() << "Failed to write to" << path;
    }
}

