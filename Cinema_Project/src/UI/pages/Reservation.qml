import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Page {
    id: reservationPage
    title: "Reservation"

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
            text: "Your Reservation"
            font.pixelSize: 36
            font.bold: true
            color: "#ffffff"
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: "Review your selected seat and movie details"
            font.pixelSize: 20
            color: "#ffb6b6"
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            height: 2
            color: "#1f2333"
            Layout.fillWidth: true
        }

        // RESERVATION CARD
        Rectangle {
            Layout.fillWidth: true
            radius: 20
            color: "#141827"
            border.color: "#2a2f45"
            border.width: 1
            height: 220

            Column {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                // FILM TITLE
                Text {
                    text: "Film: " + (reservation.filmTitle || "Unknown")
                    font.pixelSize: 26
                    font.bold: true
                    color: "#ffb6b6"
                }

                // SHOWTIME
                Text {
                    text: "Showtime: " + (reservation.showtime || "Not selected")
                    font.pixelSize: 20
                    color: "#d0d0d0"
                }

                // HALL
                Text {
                    text: "Hall: " + (reservation.hall || "Not selected")
                    font.pixelSize: 20
                    color: "#d0d0d0"
                }

                // SEAT
                Text {
                    text: "Seat: " + (reservation.seat || "Not selected")
                    font.pixelSize: 20
                    color: "#d0d0d0"
                }
            }
        }

        // BUTTONS
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 20

            // CONFIRM BUTTON
            Button {
                text: "Confirm Reservation"
                background: Rectangle {
                    radius: 10
                    color: "#1f2333"
                    border.color: "#7cff7c"
                    border.width: 1
                }
                contentItem: Text {
                    text: parent.text
                    color: "#7cff7c"
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    console.log("Reservation confirmed:",
                                reservation.filmTitle,
                                reservation.showtime,
                                reservation.hall,
                                reservation.seat)
                    stackView.pop()
                }
            }

            // CANCEL BUTTON
            Button {
                text: "Cancel"
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

                onClicked: stackView.pop()
            }
        }
    }

    // Reservation data object (you can fill this from Hall pages)
    property var reservation: {
        "filmTitle": "",
        "showtime": "",
        "hall": "",
        "seat": ""
    }
}
