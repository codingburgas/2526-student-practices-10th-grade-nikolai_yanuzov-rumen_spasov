#include "login.hpp"




void Loger::onSubmitPressed(const QString &email, const QString &password) {
    qDebug() << "Submit pressed!";
    qDebug() << "Email:" << email;
    qDebug() << "Password:" << password;

    // Your login logic here
    if (email.isEmpty() || password.isEmpty()) {
        emit loginError("Fields cannot be empty");
    }else if(!email.contains('@')){
        emit loginError("Invalid email format");
    }
    else {
        emit loginSuccess();
    }
}

