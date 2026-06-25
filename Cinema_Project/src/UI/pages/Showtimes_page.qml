import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: showtimesPage
    title: "Showtimes"

    Rectangle {
        anchors.fill: parent
        color: "#0b0e1a" // dark navy background
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 30

        // Header
        Text {
            text: "Today's Showtimes"
            font.pixelSize: 36
            font.bold: true
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: "Check the latest movie schedule"
            font.pixelSize: 20
            color: "#ffb6b6"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            height: 2
            color: "#1f2333"
            Layout.fillWidth: true
        }

        // ADMIN BUTTONS
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20
            visible: auth.isAdmin

            // Add New button
            Button {
                text: "Add New"
                background: Rectangle {
                    radius: 10
                    color: "#1f2333"
                    border.color: "#ffb6b6"
                    border.width: 1
                }
                contentItem: Text {
                    text: parent.text
                    color: "#ffb6b6"
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: stackView.push("AddNew.qml")
            }

            // Delete button
            Button {
                text: "Delete"
                background: Rectangle {
                    radius: 10
                    color: "#1f2333"
                    border.color: "#ffb6b6"
                    border.width: 1
                }
                contentItem: Text {
                    text: parent.text
                    color: "#ffb6b6"
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: stackView.push("Delete.qml")
            }
        }

        // Scrollable area
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            Column {
                width: parent.width
                spacing: 20

                Repeater {
                    model: [
                        { title: "Inside Out 2", time: "14:00, 17:30, 20:00" },
                        { title: "Bad Boys: Ride or Die", time: "15:00, 18:30, 21:00" },
                        { title: "Despicable Me 4", time: "13:30, 16:00, 19:30" },
                        { title: "Deadpool & Wolverine", time: "12:00, 15:00, 18:00, 21:00" },
                        { title: "Kung Fu Panda 4", time: "11:30, 14:00, 17:00" },
                        { title: "The Garfield Movie", time: "10:00, 12:30, 15:00" },
                        { title: "Dune: Part Two", time: "16:00, 19:30, 22:00" },
                        { title: "Avatar: The Way of Water", time: "13:00, 17:00, 20:30" },
                        { title: "The Batman", time: "15:30, 19:00, 22:30" },
                        { title: "Oppenheimer", time: "14:00, 18:00, 21:30" }
                    ]

                    delegate: Rectangle {
                        width: parent.width
                        radius: 20
                        color: "#141827"
                        border.color: "#2a2f45"
                        border.width: 1
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 120

                        Column {
                            anchors.fill: parent
                            anchors.margins: 20
                            spacing: 20

                            Text {
                                text: modelData.title
                                font.pixelSize: 26
                                font.bold: true
                                color: "#ffb6b6"
                            }

                            Text {
                                text: "Showtimes: " + modelData.time
                                font.pixelSize: 18
                                color: "#d0d0d0"
                            }
                        }
                    }
                }
            }
        }

        // Back button
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
