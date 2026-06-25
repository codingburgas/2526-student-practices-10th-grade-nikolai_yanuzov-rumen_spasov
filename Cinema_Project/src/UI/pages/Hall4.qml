import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: hall4
    background: Rectangle { color: "#030619" }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 20

        Text {
            text: "Hall 4 - Classic"
            color: "white"
            font.pixelSize: 32
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            id: seatGrid
            columns: 6
            rowSpacing: 10
            columnSpacing: 10
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                model: 60   // 60 seats

                Button {
                    text: index + 1
                    width: 45
                    height: 45
                    font.pixelSize: 16
                    background: Rectangle {
                        radius: 6
                        color: "#1f2333"
                        border.color: "#e94560"
                        border.width: 1
                    }

                    onClicked: {
                        console.log("Selected seat:", index + 1)
                    }
                }
            }
        }

        Button {
            text: "Back"
            Layout.alignment: Qt.AlignHCenter
            onClicked: stackView.pop()
        }
    }
}