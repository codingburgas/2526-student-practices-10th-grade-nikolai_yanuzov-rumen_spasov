// Main_menu.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: control

    property string mainText: "Now Showing"
    property string secondaryText: "Browse current movies and showtimes"

    // Let parent set size
    implicitWidth: 443
    implicitHeight: 262

    contentItem: Item {
        anchors.fill: parent

        ColumnLayout {
            anchors.centerIn: parent
            width: parent.width * 0.9
            spacing: parent.height * 0.05

            // Main text - scales with button height
            Text {
                Layout.fillWidth: true
                text: control.mainText
                color: control.pressed ? "#ffffff" : (control.hovered?"#e94560":"#ffffff")
                font.pixelSize: Math.max(16, control.height * 0.15)
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                
                Behavior on color {
            ColorAnimation {
                duration: 500
                easing.type: Easing.OutCubic
                    }
                }
        
            }

            // Secondary text
            Text {
                Layout.fillWidth: true
                text: control.secondaryText
                color: control.pressed ? "#aaaaaa" : (control.hovered?"#888888":"#aaaaaa")
                font.pixelSize: Math.max(10, control.height * 0.1)
                font.weight: Font.Light
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                visible: control.height > 150  // Hide on very small buttons
                Behavior on color {
                    ColorAnimation {
                        duration: 500
                        easing.type: Easing.OutCubic
                    }
                }
            }
        }
    }

    
    background: Rectangle {
        id: bg
        radius: 40
        border.color: "#373f52"
        border.width: 1

        // Start with base color
        color: control.pressed ? "#070e21" : (control.hovered ? "#1C243B" : "#070e21")

        // Animate color changes
        Behavior on color {
            ColorAnimation {
                duration: 500
                easing.type: Easing.OutCubic
            }
        }
    }

    // Handle hover in the Button itself:
}


