#include "register.hpp"


RegisterController::RegisterController(QObject *parent) : QObject(parent) {}

void RegisterController::validate(const QString& username,
                                  const QString& email,
                                  const QString& password,
                                  const QString& passwordConfirm)
{
    // ===== ERROR FLAGS =====
    QString usernameError;
    QString emailError;
    QString passwordError;

    // ===== USERNAME CHECK =====
    if (username.isEmpty()) {
        usernameError = "Username cannot be empty";
    }
    else if (username.length() < 3) {
        usernameError = "Username too short";
    }
    else if (usernameStorage.contains(username)) {
        usernameError = "Username already exists";
    }

    // ===== EMAIL CHECK =====
    QRegularExpression emailRegex(R"(^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$)");

    if (email.isEmpty()) {
        emailError = "Email cannot be empty";
    }
    else if (!emailRegex.match(email).hasMatch()) {
        emailError = "Invalid email format";
    }

    // ===== PASSWORD CHECK =====
    if (password.isEmpty()) {
        passwordError = "Password cannot be empty";
    }
    else if (password.length() < 4) {
        passwordError = "Password too short";
    }
    else if (password != passwordConfirm) {
        passwordError = "Passwords do not match";
    }

    // ===== RESULT =====
    if (!usernameError.isEmpty() ||
        !emailError.isEmpty() ||
        !passwordError.isEmpty())
    {
        emit registerError(usernameError, emailError, passwordError);
        return;
    }

    // SUCCESS
    usernameStorage.push_back(username);

    emit registerSuccess();
    qDebug() << "User registered successfully";
}