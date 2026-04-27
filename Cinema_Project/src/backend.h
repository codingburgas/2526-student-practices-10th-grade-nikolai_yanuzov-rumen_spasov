#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString> // Задължително добави това

class Backend : public QObject // Добра практика е името на класа да е с главна буква
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged FINAL)

public:
    explicit Backend(QObject *parent = nullptr);

    // Getter
    QString name();

    // Setter
    void setName(const QString &newName);

signals:
    void nameChanged(); // Декларирай сигнала тук

private:
    QString m_name; // Истинската променлива, която пази данните
};

#endif // BACKEND_H