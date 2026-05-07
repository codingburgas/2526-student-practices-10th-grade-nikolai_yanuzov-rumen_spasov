import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../"
Page {
    id: login
    signal navigateTo(string page)

    property string email: ""
    property string password: ""
    property string emailPlaceholder: "your@email.com"
    property string passwordPlaceholder: "Enter password"
    property string placeholderErrorColor: "#ff4444"
    property string placeholderNormalColor: "#aaaaaa"

    // ===== CONNECTIONS TO C++ LOGER =====
    Connections {
        target: loger

        function onLoginError(error) {  // ← Note: "on" prefix!
            console.log("Login error:", error)

            // Show error in placeholder
            emailPlaceholder = error
            placeholderErrorColor = "#ff4444"
            passwordPlaceholder = error
            email = ""
            password = ""
        }

        function onLoginSuccess() {  // ← Note: "on" prefix!
            console.log("Login successful!")

            // Reset placeholders
            emailPlaceholder = "your@email.com"
            passwordPlaceholder = "Enter password"
            placeholderErrorColor = "#aaaaaa"
        }
    }

    header: Header {
        logoPlace: true

        // Back button
        Item {
            Layout.alignment: Qt.AlignVCenter
            width: backText.width + 20
            height: 80

            Text {
                id: backText
                text: "← Back"
                color: backMouse.containsMouse ? "#e94560" : "white"
                font.pixelSize: 25
                font.bold: true
                anchors.centerIn: parent
            }

            MouseArea {
                id: backMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: login.navigateTo("Main_menu.qml")
            }
        }
    }

    background: Rectangle {
        color: "#030619"
    }

    Rectangle {
        id: loginForm
        width: parent.width * 0.3
        height: parent.height * 0.7
        radius: 15
        border.width: 2
        color: "#373f52"
        anchors.centerIn: parent

        ScrollView {
            clip: true
            anchors.fill: parent

            Item {
                anchors.fill: parent
                anchors.margins: parent.width * 0.05

                // Logo + Title
                Text {
                    id: cinemaName
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.topMargin: 20
                    text: qsTr("Movix")
                    font.pixelSize: 30
                    font.bold: true
                    color: "white"
                }

                Image {
                    id: cinemaLogo
                    anchors.right: cinemaName.left
                    anchors.verticalCenter: cinemaName.verticalCenter
                    width: 30
                    height: 30
                    source: "../assets/MovixLogo.png"
                    fillMode: Image.PreserveAspectFit
                }

                // ===== EMAIL FIELD =====
                Item {
                    id: emailField
                    width: parent.width
                    height: parent.height * 0.1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * 0.23

                    Rectangle {
                        id: emailHolder
                        anchors.fill: parent
                        color: "#ffffff"
                        radius: 14
                        border.width: 1
                        border.color: "#cccccc"
                    }

                    Image {
                        id: emailLogo
                        anchors.left: parent.left
                        anchors.leftMargin: 12
                        anchors.verticalCenter: parent.verticalCenter
                        width: 24
                        height: 24
                        source: "../assets/MovixLogo.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    TextField {
                        id: emailInput  // ← Fixed typo
                        anchors.left: emailLogo.right
                        anchors.leftMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 12
                        anchors.verticalCenter: parent.verticalCenter

                        placeholderText: login.emailPlaceholder
                        placeholderTextColor: login.emailPlaceholder === "Email"?login.placeholderNormalColor:login.placeholderErrorColor
                        text: login.email
                        font.pixelSize: 14
                        color: "#333333"
                        maximumLength: 30
                        clip: true

                        onTextChanged: login.email = text

                        background: Rectangle {
                            opacity: 0
                        }
                    }

                    Text {
                        id: emailText
                        anchors.bottom: parent.top
                        anchors.left: parent.left
                        text: qsTr("Email")
                        font.pixelSize: 16
                        font.bold: true
                        color: "#fb2c36"
                    }
                }

                // ===== PASSWORD FIELD =====
                Item {
                    id: passwordField
                    width: parent.width
                    height: parent.height * 0.1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: emailField.bottom
                    anchors.topMargin: parent.height * 0.08

                    Rectangle {
                        id: passwordHolder
                        anchors.fill: parent
                        color: "#ffffff"
                        radius: 14
                        border.width: 1
                        border.color: "#cccccc"
                    }

                    TextField {
                        id: passwordInput
                        anchors.left: passwordLogo.right  // ← Fixed reference
                        anchors.leftMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 12
                        anchors.verticalCenter: parent.verticalCenter

                        placeholderText: login.passwordPlaceholder
                        placeholderTextColor: login.placeholderErrorColor
                        text: login.password
                        echoMode: TextInput.Password
                        font.pixelSize: 14
                        color: "#333333"
                        maximumLength: 30
                        clip: true

                        onTextChanged: login.password = text

                        background: Rectangle {
                            opacity: 0
                        }
                    }

                    Image {
                        id: passwordLogo  // ← Fixed typo
                        anchors.left: parent.left
                        anchors.leftMargin: 12
                        anchors.verticalCenter: parent.verticalCenter
                        width: 24
                        height: 24
                        source: "../assets/MovixLogo.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        id: passwordText
                        anchors.bottom: parent.top
                        anchors.left: parent.left
                        text: qsTr("Password")
                        font.pixelSize: 16
                        font.bold: true
                        color: "#fb2c36"
                    }
                }

                // ===== REMEMBER ME + FORGOT PASSWORD =====
                CheckBox {
                    id: checkBox
                    anchors.left: parent.left
                    anchors.top: passwordField.bottom
                    anchors.topMargin: parent.height * 0.05
                    width: 22
                    height: 22
                    text: ""
                    indicator.width: 20
                    indicator.height: 20
                }

                Text {
                    id: rememberMeText
                    anchors.left: checkBox.right
                    anchors.leftMargin: 8
                    anchors.verticalCenter: checkBox.verticalCenter
                    text: qsTr("Remember me")
                    font.pixelSize: 12
                    color: "#ffffff"
                }

                Text {
                    id: passwordReset
                    anchors.right: parent.right
                    anchors.verticalCenter: rememberMeText.verticalCenter
                    text: qsTr("Forgot Password?")
                    font.pixelSize: 13
                    font.bold: true
                    color: "#e94560"

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: console.log("Forgot password clicked")
                    }
                }

                // ===== SUBMIT BUTTON =====
                Button {
                    id: submit
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rememberMeText.bottom
                    anchors.topMargin: parent.height * 0.08
                    width: parent.width
                    height: 50
                    text: qsTr("Submit")

                    background: Rectangle {
                        radius: 14
                        color: "#e94560"
                    }

                    contentItem: Text {
                        text: submit.text
                        color: "white"
                        font.pixelSize: 16
                        font.bold: true
                        anchors.centerIn: parent
                    }

                    onClicked: {
                        console.log("Calling C++ Loger...")
                        console.log("Email:", login.email)
                        console.log("Password:", login.password)
                        loger.onSubmitPressed(login.email, login.password)
                    }
                }

                // ===== SIGN UP LINK =====
                RowLayout {
                    anchors.top: submit.bottom
                    anchors.topMargin: parent.height * 0.05
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 5

                    Text {
                        text: qsTr("Don't have an account?")
                        font.pixelSize: 12
                        color: "#888888"
                    }

                    Text {
                        text: qsTr("Sign Up")
                        font.pixelSize: 12
                        font.bold: true
                        color: "#e94560"

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: login.navigateTo("SignUpPage.qml")
                        }
                    }
                }
            }
        }
    }
}