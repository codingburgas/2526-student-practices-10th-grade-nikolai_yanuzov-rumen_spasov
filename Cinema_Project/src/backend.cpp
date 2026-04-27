#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{}

void Backend::setName(const QString &newName) {
    if (m_name != newName) {
        m_name = newName;
        emit nameChanged(); // Важно: Излъчва сигнала при промяна
    }
}

QString Backend::name(){
    return m_name;
}