import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Page {
    id: login
    signal navigateTo(string page)
    header: Header {
        logoPlace: true
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
    Rectangle {
        id: loginForm
        width: parent.width * 0.4
        height: parent.height * 0.7
        radius: 15
        border.width: 2
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        color: "#373f52"
        anchors.centerIn: parent
        Item {
            width: parent.width * 0.6
            height: parent.height * 0.07
            anchors.horizontalCenter: parent.horizontalCenter  // Center horizontally
            anchors.top: parent.top
            anchors.topMargin: 130

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
                source: "assets/MovixLogo.png"
                fillMode: Image.PreserveAspectFit
            }

            TextInput {
                id: email
                anchors.left: emailLogo.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                text: "your@email.com"
                font.pixelSize: 14
                color: "#333333"
                maximumLength: 30
                clip: true
            }

            Text {
                id: emailText
                anchors.bottom: parent.top
                anchors.left: parent.left
                width: 49
                height: 22
                text: qsTr("Email")
                font.pixelSize: 16
                font.bold: true
                color: "#fb2c36"
                opacity: 1
            }
        }

        Item {
            id: passwordField
            width: parent.width * 0.6
            height: parent.height * 0.07
            anchors.horizontalCenter: parent.horizontalCenter  // Center horizontally
            anchors.top: parent.top
            anchors.topMargin: 250

            Rectangle {
                id: passwordHolder
                anchors.fill: parent
                color: "#ffffff"
                radius: 14
                border.width: 1
                border.color: "#cccccc"
            }

            TextInput {
                id: password
                anchors.left: passworkLogo.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                text: "your@email.com"
                font.pixelSize: 14
                color: "#333333"
                maximumLength: 30
                clip: true
            }

            Image {
                id: passworkLogo
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                width: 24
                height: 24
                source: "assets/MovixLogo.png"
                fillMode: Image.PreserveAspectFit
            }
            Text {
                id: passwordText
                anchors.bottom: parent.top
                anchors.left: parent.left
                width: 49
                height: 22
                text: qsTr("PasswordText")
                font.pixelSize: 16
                font.bold: true
                color: "#fb2c36"
                opacity: 1
            }
        }

        CheckBox {
            id: checkBox
            anchors.left: parent.left
            anchors.top: passwordField.bottom
            anchors.leftMargin: parent.width * 0.15   // 8% from left
            anchors.topMargin: parent.height * 0.1    // 3% from password field
            width: 22
            height: 29
            text: ""                           // Remove default text
            indicator.width: 20
            indicator.height: 20
        }

        Text {
            id: rememberMeText
            anchors.left: checkBox.right       // Right of checkbox
            anchors.leftMargin: 8              // Small gap
            anchors.verticalCenter: checkBox.verticalCenter  // ← Align with checkbox center
            text: qsTr("Remember me")
            font.pixelSize: 12
            color: "#ffffff"                   // Add color for visibility
        }

        Button {
            id: submit
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: rememberMeText.top
            anchors.topMargin: 60
            width: 245
            height: 40
            text: qsTr("Button")
            wheelEnabled: false
        }



        Text {
            id: passwordReset
            anchors.left: rememberMeText.right
            anchors.verticalCenter: rememberMeText.verticalCenter
            anchors.leftMargin: parent.width * 0.23
            width: 76
            height: 20
            text: qsTr("Foregotten Password?")
            font.pixelSize: 13
            font.bold: true
        }

        Text {
            id: signup_1
            anchors.top: submit.bottom
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.3
            anchors.topMargin: 30
            width: 150
            height: 16
            text: qsTr("Don't have an account?")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignRight
        }

        Text {
            id: signup_2
            anchors.left: signup_1.right
            anchors.verticalCenter: signup_1.verticalCenter

            width: 65
            height: 16
            text: qsTr("Sign Up")
            font.pixelSize: 12
        }



        Text {
            id: text7
            x: 58
            y: 215
            width: 43
            height: 16
            text: qsTr("Text")
            font.pixelSize: 12
        }
    }

    Image {
        id: image
        x: 200
        y: 42
        width: 30
        height: 27
        source: "qrcimages/template_image.png"
        fillMode: Image.PreserveAspectFit
    }
}
