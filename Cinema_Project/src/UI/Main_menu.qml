import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "pages"
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

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
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

        ColumnLayout {
            width: scrollView.width
            spacing: 0

            Header {            //login button
                Button {
                    anchors.right: parent.right
                    anchors.rightMargin: 40
                    anchors.verticalCenter: parent.verticalCenter  // Align with header center
                    id: login_button
                    text: "Login"
                    hoverEnabled: true

                    background: Rectangle {
                        implicitWidth: 100
                        implicitHeight: 40
                        radius: 30
                        color: login_button.pressed ? "#373f52" : login_button.hovered ? "#ed2b313d" : "#373f52"
                        border.color: "#373f52"
                        border.width: 2

                        Behavior on color {
                            ColorAnimation {
                                duration: 500
                                easing.type: Easing.OutCubic
                            }
                        }
                    }
                    //custom button text
                    contentItem: Text {
                        text: login_button.text
                        color: login_button.hovered ? "#e94560" : "white"
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter

                        Behavior on color {
                            ColorAnimation {
                                duration: 500
                                easing.type: Easing.OutCubic
                            }
                        }
                    }

                    onClicked: navigateTo("pages/Login_page.qml")
                }
            }


            Column {
                Layout.fillWidth: true
                Layout.topMargin: 50
                Layout.bottomMargin: 40
                Layout.alignment: Qt.AlignHCenter  // ← Center the column itself
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

            // Buttons Grid - CENTERED
            GridLayout {
                id: buttonGrid
                Layout.alignment: Qt.AlignHCenter  // ← Center the grid
                Layout.topMargin: 20
                Layout.bottomMargin: 40

                columns: {
                    if (scrollView.width > 1400)
                        return 3;
                    if (scrollView.width > 900)
                        return 2;
                    return 1;
                }

                property real btnWidth: {
                    let cols = columns;
                    let maxWidth = scrollView.width * 0.85;
                    let spacingTotal = (cols - 1) * columnSpacing;
                    let availableWidth = maxWidth - spacingTotal;
                    return Math.min(443, availableWidth / cols);
                }
                property real btnHeight: btnWidth * 0.6

                rowSpacing: 30
                columnSpacing: 30

                // Fix margins - same on both sides
                Layout.leftMargin: 0
                Layout.rightMargin: 0

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

            // Footer - CENTERED
            Text {
                Layout.alignment: Qt.AlignHCenter  // ← Center the footer
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
