import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: addFilmPage
    title: "Add New Film"

    // 🔥 получаваме модела от Showtimes.qml
    property var filmsModel
    property var stackView


    Rectangle {
        anchors.fill: parent
        color: "#0b0e1a"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 40
        spacing: 30

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

        ColumnLayout {
            spacing: 20
            Layout.fillWidth: true

            TextField {
                id: filmNameField
                placeholderText: "Film name"
                Layout.fillWidth: true
            }

            TextArea {
                id: showtimesField
                placeholderText: "14:00, 17:30, 20:00"
                Layout.fillWidth: true
                Layout.preferredHeight: 100
            }

            ComboBox {
                id: hallBox
                model: ["Hall 1", "Hall 2", "Hall 3", "Hall 4"]
                Layout.fillWidth: true
            }

            TextField {
                id: lengthField
                placeholderText: "Length (minutes)"
                inputMethodHints: Qt.ImhDigitsOnly
                Layout.fillWidth: true
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            Button {
                text: "Save"
                onClicked: {
                    if (filmNameField.text === "" ||
                        showtimesField.text === "" ||
                        hallBox.currentIndex === -1 ||
                        lengthField.text === "") {

                        console.log("❌ All fields must be filled!")
                        return
                    }

                    // 🔥 добавяме филм в модела
                    filmsModel.append({
                        "title": filmNameField.text,
                        "time": showtimesField.text
                    })

                    console.log("✔ Film added:", filmNameField.text)

                    stackView.pop()   // 🔥 връщаме се към Showtimes.qml
                }
            }

            Button {
                text: "Cancel"
                onClicked: stackView.pop()
            }
        }
    }
}
