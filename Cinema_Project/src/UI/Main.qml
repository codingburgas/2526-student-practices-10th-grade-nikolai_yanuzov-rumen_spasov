import QtQuick
import QtQuick.Controls

Window {
    width: 1000
    height: 480
    visible: true

    Text {
        text: "ajsd" // Текстът ще се смени автоматично, ако name се промени
        anchors.centerIn: parent
    }
    Button {
        text: "Промени името на Иван"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
