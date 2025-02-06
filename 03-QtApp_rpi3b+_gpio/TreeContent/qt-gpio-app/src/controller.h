#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>

class Controller : public QObject {
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);
    Q_INVOKABLE void toggleLED();

private:
    void writeToFile(const QString &path, const QString &value);
    QString gpioPath;
};

#endif // CONTROLLER_H

