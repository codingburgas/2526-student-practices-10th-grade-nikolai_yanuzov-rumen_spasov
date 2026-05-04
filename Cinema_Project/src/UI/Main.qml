// Main.qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: appWindow
    visible: true
    width: 1600
    height: 900
    minimumWidth: 1200
    minimumHeight: 700
    title: "Movix Cinema"
    color: "#030619"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Main_menu {
            onNavigateTo: function(page) {
                console.log("Navigating to:", page)
                stackView.push(page)
            }
        }
    }
}
