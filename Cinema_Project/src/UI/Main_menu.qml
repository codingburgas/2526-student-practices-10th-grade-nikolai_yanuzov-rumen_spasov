// Main_menu.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: main_menu
    signal navigateTo(string page)

    background: Rectangle {
        color: "#030619"
    }

    ScrollView {
        id: scrollView
        anchors.fill: parent
        clip: true

        // Custom scrollbar
        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AlwaysOff
            width: 8

            contentItem: Rectangle {
                implicitWidth: 8
                radius: 4
                color: "#e94560"
                opacity: 0.6
            }

            background: Rectangle {
                color: "transparent"
            }
        }

        // Main content column
        ColumnLayout {
            width: scrollView.width
            spacing: 0

            // ===== HEADER =====
            Rectangle {
                id: header
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "#0d1522"
                border.color: "#373f52"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20

                    // Logo
                    Row {
                        spacing: 10
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                        Rectangle {
                            width: 30
                            height: 15
                            color: "#e94560"
                            radius: 3
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "MOVIX"
                            color: "white"
                            font.pixelSize: 24
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    // Spacer
                    Item { Layout.fillWidth: true }

                    // Login button
                    Rectangle {
                        Layout.preferredWidth: 120
                        Layout.preferredHeight: 40
                        radius: 19
                        color: "#ed2b313d"
                        border.color: "#373f52"
                        border.width: 2

                        Text {
                            anchors.centerIn: parent
                            text: "Login"
                            color: "white"
                            font.pixelSize: 16
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: navigateTo("LoginPage.qml")
                        }
                    }
                }
            }

            // ===== WELCOME SECTION =====
            Column {
                Layout.fillWidth: true
                Layout.topMargin: 50
                Layout.bottomMargin: 40
                spacing: 10

                Text {
                    text: "Welcome to Movix"
                    color: "white"
                    font.pixelSize: 42
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "Where Stories Come to Life"
                    color: "#e94560"
                    font.pixelSize: 20
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "Downtown Location • 123 Cinema Street"
                    color: "#888888"
                    font.pixelSize: 16
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            // ===== BUTTONS GRID =====
            GridLayout {
                id: buttonGrid
                Layout.fillWidth: true
                Layout.leftMargin: 100
                Layout.rightMargin: 40
                Layout.bottomMargin: 40

                // Responsive columns
                columns: scrollView.width > 1200 ? 3 : (scrollView.width > 700 ? 2 : 1)

                // Responsive button size
                property real btnWidth: {
                    let cols = columns
                    let spacing = (cols - 1) * columnSpacing
                    return Math.min(443, (scrollView.width - 80 - spacing) / cols)
                }
                property real btnHeight: btnWidth * 0.6

                rowSpacing: 30
                columnSpacing: 30

                Button1 {
                    mainText: "Now Showing"
                    secondaryText: "Browse current movies and showtimes"
                    Layout.preferredWidth: buttonGrid.btnWidth
                    Layout.preferredHeight: buttonGrid.btnHeight
                    onClicked: navigateTo("CurrentlyShowing.qml")
                }

                Button1 {
                    mainText: "Reservations"
                    secondaryText: "Book and manage your seats"
                    Layout.preferredWidth: buttonGrid.btnWidth
                    Layout.preferredHeight: buttonGrid.btnHeight
                    onClicked: navigateTo("Reservations.qml")
                }

                Button1 {
                    mainText: "Cinema Layout"
                    secondaryText: "View seating arrangement"
                    Layout.preferredWidth: buttonGrid.btnWidth
                    Layout.preferredHeight: buttonGrid.btnHeight
                    onClicked: navigateTo("CinemaLayout.qml")
                }

                Button1 {
                    mainText: "Food Orders"
                    secondaryText: "Pre-order snacks and drinks"
                    Layout.preferredWidth: buttonGrid.btnWidth
                    Layout.preferredHeight: buttonGrid.btnHeight
                    onClicked: navigateTo("FoodOrders.qml")
                }

                Button1 {
                    mainText: "Showtimes"
                    secondaryText: "Check today's movie schedule"
                    Layout.preferredWidth: buttonGrid.btnWidth
                    Layout.preferredHeight: buttonGrid.btnHeight
                    onClicked: navigateTo("Showtimes.qml")
                }

                Button1 {
                    mainText: "About Us"
                    secondaryText: "Learn about our cinema"
                    Layout.preferredWidth: buttonGrid.btnWidth
                    Layout.preferredHeight: buttonGrid.btnHeight
                    onClicked: navigateTo("AboutUs.qml")
                }
            }

            // ===== FOOTER =====
            Text {
                Layout.fillWidth: true
                Layout.topMargin: 20
                Layout.bottomMargin: 30
                horizontalAlignment: Text.AlignHCenter
                text: "© 2025 Movix Cinema. All rights reserved."
                color: "#666666"
                font.pixelSize: 14
            }
        }
    }
}