import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
//header
Rectangle {
    id: header
    height: 80
    color: "#0d1522"
    border.color: "#373f52"
    border.width: 1
    Layout.fillWidth: true
    property bool logoPlace: false

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        spacing: 10

        // Logo + Title
        RowLayout {
            id: logo
            spacing: 10
            Layout.alignment: logoPlace?Qt.AlignCenter:Qt.AlignVCenter
            //Logo
            Rectangle {
                width: 30
                height: 30
                radius: 3
                color: "#0d1522"

                Image {
                    anchors.fill: parent
                    source: "assets/MovixLogo.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            //Title
            Text {
                text: "MOVIX"
                color: "white"
                font.pixelSize: 24
                font.bold: true
                Layout.alignment: Qt.AlignVCenter
            }
        }
    }
}