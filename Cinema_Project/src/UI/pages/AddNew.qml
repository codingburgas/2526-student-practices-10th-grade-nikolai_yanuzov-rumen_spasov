import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: addFilmPage
    title: "Add New Film"

    Rectangle {
        anchors.fill: parent
        color: "#0b0e1a"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 30

        // HEADER
        Text {
            text: "Add New Film"
            font.pixelSize: 36
            font.bold: true
            color: "#ffffff"
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            height: 2
            color: "#1f2333"
            Layout.fillWidth: true
        }

        // FORM CONTAINER
        ColumnLayout {
            spacing: 20
            Layout.fillWidth: true

            // FILM NAME
            ColumnLayout {
                spacing: 6
                Layout.fillWidth: true

                Text {
                    text: "Film Name"
                    color: "#ffb6b6"
                    font.pixelSize: 18
                }

                TextField {
                    id: filmNameField
                    placeholderText: "Enter film name"
                    font.pixelSize: 18
                    color: "#ffffff"
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 10
                        color: "#141827"
                        border.color: "#ffb6b6"
                        border.width: 1
                    }
                }
            }

            // SHOWTIMES
            ColumnLayout {
                spacing: 6
                Layout.fillWidth: true

                Text {
                    text: "Showtimes"
                    color: "#ffb6b6"
                    font.pixelSize: 18
                }

                TextArea {
                    id: showtimesField
                    placeholderText: "Example: 14:00, 17:30, 20:00"
                    font.pixelSize: 18
                    color: "#ffffff"
                    wrapMode: TextEdit.Wrap
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100

                    background: Rectangle {
                        radius: 10
                        color: "#141827"
                        border.color: "#ffb6b6"
                        border.width: 1
                    }
                }
            }

            // HALL
            ColumnLayout {
                spacing: 6
                Layout.fillWidth: true

                Text {
                    text: "Hall"
                    color: "#ffb6b6"
                    font.pixelSize: 18
                }

                ComboBox {
                    id: hallBox
                    model: ["Hall 1", "Hall 2", "Hall 3", "Hall 4"]
                    font.pixelSize: 18
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 10
                        color: "#141827"
                        border.color: "#ffb6b6"
                        border.width: 1
                    }
                }
            }

            // LENGTH
            ColumnLayout {
                spacing: 6
                Layout.fillWidth: true

                Text {
                    text: "Film Length (minutes)"
                    color: "#ffb6b6"
                    font.pixelSize: 18
                }

                TextField {
                    id: lengthField
                    placeholderText: "Example: 120"
                    font.pixelSize: 18
                    color: "#ffffff"
                    inputMethodHints: Qt.ImhDigitsOnly
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 10
                        color: "#141827"
                        border.color: "#ffb6b6"
                        border.width: 1
                    }
                }
            }
        }

        // BUTTONS
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            // SAVE BUTTON
            Button {
                text: "Save"
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

                onClicked: {
                    console.log("Film added:",
                                filmNameField.text,
                                showtimesField.text,
                                hallBox.currentText,
                                lengthField.text)
                    stackView.pop()
                }
            }

            // CANCEL BUTTON
            Button {
                text: "Cancel"
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
}
