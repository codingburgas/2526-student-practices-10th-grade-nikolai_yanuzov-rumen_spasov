import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
            policy: ScrollBar.AlwaysOff
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

            Rectangle {
                id: header
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                color: "#0d1522"
                border.color: "#373f52"
                border.width: 1

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20

                    Row {
                        spacing: 10
                        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                        Rectangle {
                            width: 30
                            height: 15
                            color: "#e94560"
                            radius: 3
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "MOVIX"
                            color: "white"
                            font.pixelSize: 24
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }

                    Item { Layout.fillWidth: true }

                    Button {
                        id: control
                        text: "Login"
                        hoverEnabled: true

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            radius: 30
                            color: control.pressed ? "#373f52" : (control.hovered ? "#ed2b313d" : "#373f52")
                            border.color: "#373f52"
                            border.width: 2

                            Behavior on color {
                                ColorAnimation {
                                    duration: 500
                                    easing.type: Easing.OutCubic
                                }
                            }
                        }

                        contentItem: Text {
                            text: control.text
                            color: control.hovered ? "#e94560" : "white"
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
                    }
                }
            }

            Column {
                Layout.fillWidth: true
                Layout.topMargin: 50
                Layout.bottomMargin: 40
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

            Text {
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