import QtQuick

Rectangle {
    id: scrim

    property alias scrimBorderColor: scrim.border.color
    property alias scrimBorderWidth: scrim.border.width

    height: 1800
    width: 1400

    border.color: "white"
    border.width: 0
    clip: true
    color: "#000000"
    opacity: 0.32
}