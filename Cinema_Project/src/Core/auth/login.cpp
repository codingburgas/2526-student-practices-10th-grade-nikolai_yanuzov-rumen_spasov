#include "login.hpp"




LogerController::LogerController(QObject *parent):QObject(parent)
{

}

void LogerController::validate(const QString &email, const QString &password) {
    qDebug() << "Submit pressed!";
    qDebug() << "Email:" << email;
    qDebug() << "Password:" << password;

    // Your login logic here
    if (email.isEmpty() || password.isEmpty()) {
        emit loginError("Fields cannot be empty", "");
    }else if(!loginStorage.contains(email)){
        emit loginError("No such email", "");
    }else if(loginStorage[email]!=password){
        emit loginError("", "Wrong Password");
    }
    else {
        emit loginSuccess();
    }
}

