import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: foodPage
    signal foodSelected(string itemName)

    background: Rectangle { color: "#030619" }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 30

        Text {
            text: "Food & Snacks"
            color: "white"
            font.pixelSize: 36
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        // ---- FOOD MODEL ----
        ListModel {
            id: foodModel

            ListElement { name: "Popcorn"; price: "5.00"; desc: "Classic salted popcorn" }
            ListElement { name: "Nachos"; price: "6.50"; desc: "Crispy nachos with cheese" }
            ListElement { name: "Hot Dog"; price: "4.50"; desc: "Fresh bun with sausage" }
            ListElement { name: "Coca-Cola"; price: "3.00"; desc: "Cold refreshing drink" }
            ListElement { name: "Fanta"; price: "3.00"; desc: "Orange soda" }
            ListElement { name: "Water"; price: "2.00"; desc: "Mineral water" }
        }

        GridLayout {
            id: foodGrid
            columns: 2
            rowSpacing: 30
            columnSpacing: 30
            Layout.alignment: Qt.AlignHCenter

            // ---- FOOD CARDS ----
            Repeater {
                model: foodModel

                Rectangle {
                    width: 300
                    height: 160
                    radius: 20
                    color: "#11162e"
                    border.color: "#e94560"
                    border.width: 2

                    property bool hovered: false

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: parent.hovered = true
                        onExited: parent.hovered = false
                        onClicked: foodPage.foodSelected(model.name)
                    }

                    // Hover effect (gray)
                    Rectangle {
                        anchors.fill: parent
                        radius: 20
                        color: parent.hovered ? "#80808044" : "transparent"
                        Behavior on color { ColorAnimation { duration: 200 } }
                    }

                    Column {
                        anchors.centerIn: parent
                        spacing: 6

                        Text {
                            text: model.name
                            color: "white"
                            font.pixelSize: 26
                            font.bold: true
                        }

                        Text {
                            text: model.desc
                            color: "#bbbbbb"
                            font.pixelSize: 14
                        }

                        Text {
                            text: model.price + " лв"
                            color: "#e94560"
                            font.pixelSize: 18
                            font.bold: true
                        }
                    }
                }
            }

            // ---- BACK BUTTON ----
            Button {
                text: "Back"
                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 18

                background: Rectangle {
                    radius: 10
                    color: "#1f2333"
                    border.color: "#ffb6b6"
                    border.width: 1
                    implicitWidth: contentItem.implicitWidth + 40
                    implicitHeight: contentItem.implicitHeight + 20
                }

                contentItem: Text {
                    text: parent.text
                    color: "#ffb6b6"
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: stackView.pop()
            }
        }
    }
}