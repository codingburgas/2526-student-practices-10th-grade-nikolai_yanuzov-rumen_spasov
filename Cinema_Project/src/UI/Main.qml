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
                let newPage = stackView.push(page)
                if (newPage && newPage.navigateTo) {
                    newPage.navigateTo.connect(function(p) {
                        stackView.pop()  // Go back
                    })
                }
            }
        }
        pushEnter: Transition {
            ParallelAnimation {
                PropertyAnimation {
                    property: "x"
                    from: stackView.width
                    to: 0
                    duration: 400
                    easing.type: Easing.OutCubic
                }
            }
        }

        // Push: Old page slides left
        pushExit: Transition {
            PropertyAnimation {
                property: "x"
                from: 0
                to: -stackView.width
                duration: 400
                easing.type: Easing.InCubic
            }

        }

        // Pop: Slide in from left
        popEnter: Transition {
            PropertyAnimation {
                property: "x"
                from: -stackView.width
                to: 0
                duration: 400
                easing.type: Easing.OutCubic
            }
        }

        // Pop: Current page slides right
        popExit: Transition {
            PropertyAnimation {
                property: "x"
                from: 0
                to: stackView.width
                duration: 400
                easing.type: Easing.InCubic
            }
        }
    }
}
