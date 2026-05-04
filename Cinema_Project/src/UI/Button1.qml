// Button1.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: control

    property string mainText: "Button"
    property string secondaryText: ""

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
                color: "#ffffff"
                font.pixelSize: Math.max(16, control.height * 0.15)
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }

            // Secondary text
            Text {
                Layout.fillWidth: true
                text: control.secondaryText
                color: "#aaaaaa"
                font.pixelSize: Math.max(10, control.height * 0.1)
                font.weight: Font.Light
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                visible: control.height > 150  // Hide on very small buttons
            }
        }
    }

    background: Rectangle {
        id: bg
        radius: 40
        border.color: "#373f52"
        border.width: 1

        // Start with base color
        color: "#070e21"

        // Animate color changes
        Behavior on color {
            ColorAnimation {
                duration: 200
                easing.type: Easing.OutCubic
            }
        }
    }

    // Handle hover in the Button itself:
    onHoveredChanged: {
        if (hovered) {
            bg.color = "#0f1a3a"  // Slightly lighter
        } else {
            bg.color = "#070e21"  // Back to base
        }
    }

    onPressedChanged: {
        if (pressed) {
            bg.color = "#e94560"  // Highlight on click
        } else if (hovered) {
            bg.color = "#0f1a3a"  // Back to hover state
        } else {
            bg.color = "#070e21"  // Back to normal
        }
    }
}