import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: aboutPage
    title: "About Us"

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
            text: "About Movix"
            font.pixelSize: 36
            font.bold: true
            color: "#ffffff"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: "Where Stories Come to Life"
            font.pixelSize: 20
            color: "#ffb6b6" // soft pink accent
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            height: 2
            color: "#1f2333"
            Layout.fillWidth: true
        }

        // Info card
        Rectangle {
            Layout.fillWidth: true
            radius: 20
            color: "#141827"
            border.color: "#2a2f45"
            border.width: 1

            ColumnLayout {
                anchors.fill: parent
                spacing: 16

                Text {
                    text: "Created by Rumen and Nikolay"
                    font.pixelSize: 22
                    font.bold: true
                    color: "#ffb6b6"
                }

                Text {
                    text: "Movix was developed as a school project to create a modern, elegant cinema application. Our goal is to make browsing movies, showtimes, and reservations feel effortless and cinematic."
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#d0d0d0"
                }

                Text {
                    text: "Technologies Used:"
                    font.pixelSize: 20
                    font.bold: true
                    color: "#ffb6b6"
                }

                Text {
                    text: "• C++\n• Qt 6\n• QML / Qt Quick\n• Custom UI Components"
                    wrapMode: Text.WordWrap
                    font.pixelSize: 18
                    color: "#c0c0c0"
                }
            }
        }

        Item { Layout.fillHeight: true }

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
