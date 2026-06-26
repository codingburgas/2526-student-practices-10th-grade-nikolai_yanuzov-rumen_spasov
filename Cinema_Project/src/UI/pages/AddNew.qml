import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: addFilmPage
    title: "Add New Film"

    property var filmsModel
    property var stackView

    Rectangle {
        anchors.fill: parent
        color: "#0b0e1a"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 35

        Text {
            text: "Add New Film"
            font.pixelSize: 40
            font.bold: true
            color: "#ffb6b6"
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            height: 2
            color: "#2a2f45"
            Layout.fillWidth: true
        }

        // FORM
        ColumnLayout {
            spacing: 25
            Layout.fillWidth: true

            // FILM NAME
            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true

                Text {
                    text: "Film Name"
                    color: "#ffb6b6"
                    font.pixelSize: 20
                }

                TextField {
                    id: filmNameField
                    placeholderText: "Enter film name"
                    font.pixelSize: 18
                    color: "white"
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 12
                        color: "#141827"
                        border.color: "#ffb6b6"
                        border.width: 1
                    }
                }
            }

            // SHOWTIMES
            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true

                Text {
                    text: "Showtimes"
                    color: "#ffb6b6"
                    font.pixelSize: 20
                }

                TextArea {
                    id: showtimesField
                    placeholderText: "14:00, 17:30, 20:00"
                    font.pixelSize: 18
                    color: "white"
                    wrapMode: TextEdit.Wrap
                    Layout.fillWidth: true
                    Layout.preferredHeight: 110

                    background: Rectangle {
                        radius: 12
                        color: "#141827"
                        border.color: "#ffb6b6"
                        border.width: 1
                    }
                }
            }

            // HALL
            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true

                Text {
                    text: "Hall"
                    color: "#ffb6b6"
                    font.pixelSize: 20
                }

                ComboBox {
                    id: hallBox
                    model: ["Hall 1", "Hall 2", "Hall 3", "Hall 4"]
                    font.pixelSize: 18
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 12
                        color: "#141827"
                        border.color: "#ffb6b6"
                        border.width: 1
                    }
                }
            }

            // LENGTH
            ColumnLayout {
                spacing: 8
                Layout.fillWidth: true

                Text {
                    text: "Film Length (minutes)"
                    color: "#ffb6b6"
                    font.pixelSize: 20
                }

                TextField {
                    id: lengthField
                    placeholderText: "Example: 120"
                    font.pixelSize: 18
                    color: "white"
                    inputMethodHints: Qt.ImhDigitsOnly
                    Layout.fillWidth: true

                    background: Rectangle {
                        radius: 12
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
            spacing: 30

            // SAVE BUTTON
            Button {
                text: "Save"
                width: 150
                height: 50

                background: Rectangle {
                    radius: 12
                    color: "#1f2333"
                    border.color: "#ffb6b6"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "#ffb6b6"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    if (filmNameField.text === "" ||
                        showtimesField.text === "" ||
                        hallBox.currentIndex === -1 ||
                        lengthField.text === "") {

                        console.log("All fields must be filled!")
                        return
                    }

                    filmsModel.append({
                        "title": filmNameField.text,
                        "time": showtimesField.text
                    })

                    console.log("Film added:", filmNameField.text)
                    stackView.pop()
                }
            }

            // CANCEL BUTTON
            Button {
                text: "Cancel"
                width: 150
                height: 50

                background: Rectangle {
                    radius: 12
                    color: "#1f2333"
                    border.color: "#ffb6b6"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "#ffb6b6"
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: stackView.pop()
            }
        }
    }
}
