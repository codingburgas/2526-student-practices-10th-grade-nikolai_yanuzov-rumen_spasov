import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: deleteFilmPage
    title: "Delete Film"

    // 🔥 получаваме модела и stackView от Showtimes.qml
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

        // HEADER
        Text {
            text: "Delete Film"
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

            // FILM TITLE
            ColumnLayout {
                spacing: 6
                Layout.fillWidth: true

                Text {
                    text: "Film Title"
                    color: "#ffb6b6"
                    font.pixelSize: 18
                }

                TextField {
                    id: filmTitleField
                    placeholderText: "Enter film title"
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

            // SHOWTIME
            ColumnLayout {
                spacing: 6
                Layout.fillWidth: true

                Text {
                    text: "Showtime to Delete"
                    color: "#ffb6b6"
                    font.pixelSize: 18
                }

                TextField {
                    id: showtimeField
                    placeholderText: "Example: 17:30"
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
        }

        // BUTTONS
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            // DELETE BUTTON
            Button {
                text: "Delete"
                background: Rectangle {
                    radius: 10
                    color: "#1f2333"
                    border.color: "#ff6b6b"
                    border.width: 1
                }
                contentItem: Text {
                    text: parent.text
                    color: "#ff6b6b"
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    console.log("Trying to delete:", filmTitleField.text, showtimeField.text)

                    // 🔥 Търсим филм по заглавие
                    for (var i = 0; i < filmsModel.count; i++) {
                        if (filmsModel.get(i).title === filmTitleField.text) {

                            // Ако showtime е празно → трие целия филм
                            if (showtimeField.text === "") {
                                filmsModel.remove(i)
                                console.log("✔ Film deleted:", filmTitleField.text)
                                stackView.pop()
                                return
                            }

                            // 🔥 Ако има showtime → трие само този час
                            var times = filmsModel.get(i).time.split(", ")
                            var index = times.indexOf(showtimeField.text)

                            if (index !== -1) {
                                times.splice(index, 1)

                                if (times.length === 0) {
                                    // Няма останали часове → трие целия филм
                                    filmsModel.remove(i)
                                } else {
                                    // Обновяваме часовете
                                    filmsModel.set(i, {
                                        title: filmsModel.get(i).title,
                                        time: times.join(", ")
                                    })
                                }

                                console.log("✔ Showtime deleted:", showtimeField.text)
                                stackView.pop()
                                return
                            }
                        }
                    }

                    console.log("❌ Film or showtime not found")
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
