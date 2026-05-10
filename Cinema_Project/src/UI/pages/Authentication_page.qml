import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../"

Page {

    id: page
    signal navigateTo(string page)
    signal toggleForm()
    property bool pageToggle: true

    onToggleForm: function () {
        if (pageToggle)
            pageToggle = false;
        else
            pageToggle = true;
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
                onClicked: page.navigateTo("Main_menu.qml")
            }
        }
    }

    background: Rectangle {
        color: "#030619"
    }

    Rectangle {
        id: login


        property string email: ""
        property string password: ""
        property string emailPlaceholder: "your@email.com"
        property string passwordPlaceholder: "Enter password"
        property bool isError: false
        property string error: ""


        // ===== CONNECTIONS TO C++ LOGER =====
        Connections {
            // Enable the connection only when the target object exists
            enabled: auth && auth.loginCon
            // The target itself can be a simple expression
            target: enabled ? auth.loginCon : null

            function onLoginError(emailError, passError) {
                console.log("Login error:", emailError, passError);

                login.isError = true;

                if (emailError !== "") {
                    login.error = emailError;
                } else {
                    login.error = passError;
                }

                login.email = "";
                login.password = "";
            }

            function onLoginSuccess() {
                console.log("Login successful!");

                login.isError = false;
                login.error = "";

                page.navigateTo("../Main_menu");
            }
        }





        visible: pageToggle

        width: parent.width * 0.3
        height: parent.height * 0.7

        radius: 15
        border.width: 2

        color: "#373f52"

        anchors.centerIn: parent

        ScrollView {
            id: loginScrollView
            anchors.fill: parent
            clip: true


            contentWidth: availableWidth

                ColumnLayout {
                    id: loginColumn

                    width: Math.min(loginScrollView.availableWidth * 0.9, 500)

                    anchors.horizontalCenter: parent.horizontalCenter

                    spacing: 25

                    // ===== HEADER =====
                    RowLayout {
                        Layout.topMargin: 20
                        Layout.leftMargin: 10

                        spacing: 10

                        Image {
                            source: "../assets/MovixLogo.png"

                            width: 30
                            height: 30

                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            text: qsTr("Movix")

                            font.pixelSize: 30
                            font.bold: true

                            color: "white"
                        }
                    }

                    // ===== ERROR FIELD =====
                    Rectangle {
                        id: loginPopupMessage

                        Layout.fillWidth: true
                        Layout.preferredHeight: 25

                        radius: 10
                        color: "#fb2c36"

                        visible: login.isError

                        Text {
                            anchors.centerIn: parent

                            text: login.error

                            color: "white"

                            font.pixelSize: 14
                            font.bold: true
                        }
                    }

                    // ===== EMAIL LABEL =====
                    Text {
                        text: qsTr("Email")

                        font.pixelSize: 16
                        font.bold: true

                        color: "#fb2c36"

                        Layout.topMargin: 30
                    }

                    // ===== EMAIL FIELD =====
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 55

                        radius: 14
                        color: "#ffffff"

                        border.width: 1
                        border.color: "#cccccc"

                        RowLayout {
                            anchors.fill: parent

                            anchors.leftMargin: 12
                            anchors.rightMargin: 12

                            spacing: 10

                            Image {
                                source: "../assets/MovixLogo.png"

                                width: 24
                                height: 24

                                fillMode: Image.PreserveAspectFit
                            }

                            TextField {
                                id: loginEmailInput

                                Layout.fillWidth: true

                                placeholderText: login.emailPlaceholder
                                placeholderTextColor: "#aaaaaa"

                                text: login.email

                                font.pixelSize: 14
                                color: "#333333"

                                maximumLength: 30
                                clip: true

                                onTextChanged: {
                                    login.email = text
                                }

                                background: Rectangle {
                                    opacity: 0
                                }
                            }
                        }
                    }

                    // ===== PASSWORD LABEL =====
                    Text {
                        text: qsTr("Password")

                        font.pixelSize: 16
                        font.bold: true

                        color: "#fb2c36"
                    }

                    // ===== PASSWORD FIELD =====
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 55

                        radius: 14
                        color: "#ffffff"

                        border.width: 1
                        border.color: "#cccccc"

                        RowLayout {
                            anchors.fill: parent

                            anchors.leftMargin: 12
                            anchors.rightMargin: 12

                            spacing: 10

                            Image {
                                source: "../assets/MovixLogo.png"

                                width: 24
                                height: 24

                                fillMode: Image.PreserveAspectFit
                            }

                            TextField {
                                id: loginPasswordInput

                                Layout.fillWidth: true

                                placeholderText: login.passwordPlaceholder
                                placeholderTextColor: "#aaaaaa"

                                text: login.password

                                echoMode: TextInput.Password

                                font.pixelSize: 14
                                color: "#333333"

                                maximumLength: 30
                                clip: true

                                onTextChanged: {
                                    login.password = text
                                }

                                background: Rectangle {
                                    opacity: 0
                                }
                            }
                        }
                    }

                    // ===== OPTIONS =====
                    RowLayout {
                        Layout.fillWidth: true

                        spacing: 10

                        CheckBox {
                            id: loginCheckBox
                        }

                        Text {
                            text: qsTr("Remember me")

                            font.pixelSize: 12
                            color: "#ffffff"
                        }

                        Item {
                            Layout.fillWidth: true
                        }

                        Text {
                            text: qsTr("Forgot Password?")

                            font.pixelSize: 13
                            font.bold: true

                            color: "#e94560"

                            MouseArea {
                                anchors.fill: parent

                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    console.log("Forgot password clicked")
                                }
                            }
                        }
                    }

                    // ===== SUBMIT BUTTON =====
                    Button {
                        id: loginSubmitButton

                        Layout.fillWidth: true
                        Layout.preferredHeight: 50

                        text: qsTr("Login")

                        background: Rectangle {
                            radius: 14
                            color: "#e94560"
                        }

                        contentItem: Text {
                            text: loginSubmitButton.text

                            color: "white"

                            font.pixelSize: 16
                            font.bold: true

                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        onClicked: {
                            console.log("Calling C++ Login...")
                            console.log("Email:", login.email)
                            console.log("Password:", login.password)

                            auth.login(
                                login.email,
                                login.password
                            )
                        }
                    }

                    // ===== SIGN UP =====
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.bottomMargin: 20

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

                                onClicked: {
                                    page.toggleForm()
                                }
                            }
                        }
                    }
                }
            }
        }
    Rectangle {
        id: registerForm


        property string username: ""
        property string email: ""
        property string password: ""
        property string confirmPassword: ""

        property string usernamePlaceholder: "Enter username"
        property string emailPlaceholder: "your@email.com"
        property string passwordPlaceholder: "Enter password"
        property string confirmPasswordPlaceholder: "Confirm password"

        property bool isError: false
        property string error: ""


        Connections {
            target: auth && auth.registeringCon ? auth.registeringCon : null

            function onRegisterError(usernameError, emailError, passError) {
                console.log("Register error:", usernameError, emailError, passError);

                registerForm.isError = true;

                // prioritize username error
                if (usernameError !== "") {
                    registerForm.error = usernameError;
                }
                else if (emailError !== "") {
                    registerForm.error = emailError;
                }
                else {
                    registerForm.error = passError;
                }

                registerForm.username = "";
                registerForm.email = "";
                registerForm.password = "";
                registerForm.confirmPassword = "";
            }

            function onRegisterSuccess() {
                console.log("Register successful!");

                registerForm.isError = false;
                registerForm.error = "";

                page.pageToggle = true; // go back to login
            }
        }

        visible: !page.pageToggle

        width: parent.width * 0.3
        height: parent.height * 0.7

        radius: 15
        border.width: 2

        color: "#373f52"

        anchors.centerIn: parent

        ScrollView {
            anchors.fill: parent
            clip: true

            contentWidth: availableWidth

                ColumnLayout {
                    id: registerColumn

                    width: registerForm.width * 0.9

                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter

                    spacing: 20

                    // ===== HEADER =====
                    RowLayout {
                        Layout.topMargin: 20
                        Layout.leftMargin: 10

                        spacing: 10

                        Image {
                            source: "../assets/MovixLogo.png"

                            width: 30
                            height: 30

                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            text: qsTr("Movix")

                            font.pixelSize: 30
                            font.bold: true

                            color: "white"
                        }
                    }

                    // ===== ERROR MESSAGE =====
                    Rectangle {
                        id: registerPopupMessage

                        Layout.fillWidth: true
                        Layout.preferredHeight: 30

                        radius: 10
                        color: "#fb2c36"

                        visible: registerForm.isError

                        Text {
                            anchors.centerIn: parent

                            text: registerForm.error

                            color: "white"

                            font.pixelSize: 14
                            font.bold: true
                        }
                    }

                    // =====================================================
                    // ================= USERNAME ==========================
                    // =====================================================

                    Text {
                        text: qsTr("Username")

                        font.pixelSize: 16
                        font.bold: true

                        color: "#fb2c36"

                        Layout.topMargin: 10
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 55

                        radius: 14
                        color: "#ffffff"

                        border.width: 1
                        border.color: "#cccccc"

                        RowLayout {
                            anchors.fill: parent

                            anchors.leftMargin: 12
                            anchors.rightMargin: 12

                            spacing: 10

                            Image {
                                source: "../assets/MovixLogo.png"

                                width: 24
                                height: 24

                                fillMode: Image.PreserveAspectFit
                            }

                            TextField {
                                id: registerUsernameInput

                                Layout.fillWidth: true

                                placeholderText: registerForm.usernamePlaceholder
                                placeholderTextColor: "#aaaaaa"

                                text: registerForm.username

                                font.pixelSize: 14
                                color: "#333333"

                                maximumLength: 30
                                clip: true

                                onTextChanged: {
                                    registerForm.username = text
                                }

                                background: Rectangle {
                                    opacity: 0
                                }
                            }
                        }
                    }

                    // =====================================================
                    // ================= EMAIL =============================
                    // =====================================================

                    Text {
                        text: qsTr("Email")

                        font.pixelSize: 16
                        font.bold: true

                        color: "#fb2c36"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 55

                        radius: 14
                        color: "#ffffff"

                        border.width: 1
                        border.color: "#cccccc"

                        RowLayout {
                            anchors.fill: parent

                            anchors.leftMargin: 12
                            anchors.rightMargin: 12

                            spacing: 10

                            Image {
                                source: "../assets/MovixLogo.png"

                                width: 24
                                height: 24

                                fillMode: Image.PreserveAspectFit
                            }

                            TextField {
                                id: registerEmailInput

                                Layout.fillWidth: true

                                placeholderText: registerForm.emailPlaceholder
                                placeholderTextColor: "#aaaaaa"

                                text: registerForm.email

                                font.pixelSize: 14
                                color: "#333333"

                                maximumLength: 40
                                clip: true

                                onTextChanged: {
                                    registerForm.email = text
                                }

                                background: Rectangle {
                                    opacity: 0
                                }
                            }
                        }
                    }

                    // =====================================================
                    // ================= PASSWORD ==========================
                    // =====================================================

                    Text {
                        text: qsTr("Password")

                        font.pixelSize: 16
                        font.bold: true

                        color: "#fb2c36"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 55

                        radius: 14
                        color: "#ffffff"

                        border.width: 1
                        border.color: "#cccccc"

                        RowLayout {
                            anchors.fill: parent

                            anchors.leftMargin: 12
                            anchors.rightMargin: 12

                            spacing: 10

                            Image {
                                source: "../assets/MovixLogo.png"

                                width: 24
                                height: 24

                                fillMode: Image.PreserveAspectFit
                            }

                            TextField {
                                id: registerPasswordInput

                                Layout.fillWidth: true

                                placeholderText: registerForm.passwordPlaceholder
                                placeholderTextColor: "#aaaaaa"

                                text: registerForm.password

                                echoMode: TextInput.Password

                                font.pixelSize: 14
                                color: "#333333"

                                maximumLength: 30
                                clip: true

                                onTextChanged: {
                                    registerForm.password = text
                                }

                                background: Rectangle {
                                    opacity: 0
                                }
                            }
                        }
                    }

                    // =====================================================
                    // ============ CONFIRM PASSWORD =======================
                    // =====================================================

                    Text {
                        text: qsTr("Confirm Password")

                        font.pixelSize: 16
                        font.bold: true

                        color: "#fb2c36"
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 55

                        radius: 14
                        color: "#ffffff"

                        border.width: 1
                        border.color: "#cccccc"

                        RowLayout {
                            anchors.fill: parent

                            anchors.leftMargin: 12
                            anchors.rightMargin: 12

                            spacing: 10

                            Image {
                                source: "../assets/MovixLogo.png"

                                width: 24
                                height: 24

                                fillMode: Image.PreserveAspectFit
                            }

                            TextField {
                                id: registerConfirmPasswordInput

                                Layout.fillWidth: true

                                placeholderText: registerForm.confirmPasswordPlaceholder
                                placeholderTextColor: "#aaaaaa"

                                text: registerForm.confirmPassword

                                echoMode: TextInput.Password

                                font.pixelSize: 14
                                color: "#333333"

                                maximumLength: 30
                                clip: true

                                onTextChanged: {
                                    registerForm.confirmPassword = text
                                }

                                background: Rectangle {
                                    opacity: 0
                                }
                            }
                        }
                    }

                    // ===== SUBMIT BUTTON =====
                    Button {
                        id: registerSubmitButton

                        Layout.fillWidth: true
                        Layout.preferredHeight: 50

                        Layout.topMargin: 10

                        text: qsTr("Register")

                        background: Rectangle {
                            radius: 14
                            color: "#e94560"
                        }

                        contentItem: Text {
                            text: registerSubmitButton.text

                            color: "white"

                            font.pixelSize: 16
                            font.bold: true

                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        onClicked: {
                            console.log("Username:", registerForm.username)
                            console.log("Email:", registerForm.email)
                            console.log("Password:", registerForm.password)
                            console.log("Confirm:", registerForm.confirmPassword)

                            auth.registerUser(
                                registerForm.username,
                                registerForm.email,
                                registerForm.password,
                                registerForm.confirmPassword
                            )
                        }
                    }

                    // ===== LOGIN LINK =====
                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter
                        Layout.bottomMargin: 20

                        spacing: 5

                        Text {
                            text: qsTr("Already have an account?")

                            font.pixelSize: 12
                            color: "#888888"
                        }

                        Text {
                            text: qsTr("Login")

                            font.pixelSize: 12
                            font.bold: true

                            color: "#e94560"

                            MouseArea {
                                anchors.fill: parent

                                cursorShape: Qt.PointingHandCursor

                                onClicked: {
                                    page.pageToggle = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
