import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: cinemaLayout
    signal hallSelected(string hallName)

    background: Rectangle { color: "#030619" }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 30

        Text {
            text: "Choose a Hall"
            color: "white"
            font.pixelSize: 36
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        // ---- MODEL WITH 4 HALLS ----
        ListModel {
            id: hallModel

            ListElement { hallName: "Hall 1"; seats: "120"; screenType: "IMAX Screen" }
            ListElement { hallName: "Hall 2"; seats: "80";  screenType: "Dolby Atmos" }
            ListElement { hallName: "Hall 3"; seats: "150"; screenType: "4DX Motion" }
            ListElement { hallName: "Hall 4"; seats: "60";  screenType: "Classic Screen" }
        }

        GridLayout {
            id: hallGrid
            columns: 2
            rowSpacing: 30
            columnSpacing: 30
            Layout.alignment: Qt.AlignHCenter

            // ---- REPEATER (NO MORE UNDEFINED!) ----
            Repeater {
                model: hallModel

                Rectangle {
                    width: 300
                    height: 180
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
                        onClicked: cinemaLayout.hallSelected(model.hallName)
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
                            text: model.hallName
                            color: "white"
                            font.pixelSize: 26
                            font.bold: true
                        }

                        Text {
                            text: model.seats + " seats"
                            color: "#bbbbbb"
                            font.pixelSize: 16
                        }

                        Text {
                            text: model.screenType
                            color: "#e94560"
                            font.pixelSize: 16
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