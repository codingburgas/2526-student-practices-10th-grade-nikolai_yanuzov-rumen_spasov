import QtQuick

Item {
    id: main_menu

    height: 2000
    width: 2000
    Rectangle {
        id: scrim

        height: 2000
        width: 2000

        clip: true
        color: "#182230"
        opacity: 1
    }
    Rectangle {
        id: header

        height: 166
        width: 2000
        color: "#0d1522"

    }
    Item {
        id: header_name

        x: 61
        y: 48

        height: 66
        width: 204

        Text {
            id: logo_text

            x: 76

            height: 62
            width: 127

            color: "#ffffff"
            font.family: "Inter"
            font.letterSpacing: -2
            font.pixelSize: 40
            font.weight: Font.Bold
            horizontalAlignment: Text.AlignLeft
            lineHeight: 48
            lineHeightMode: Text.FixedHeight
            text: "Movix"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
        Image {
            id: logo_image

            y: 4

            source: Qt.resolvedUrl("assets/rectangle_2.png")
        }
    }
    Item {
        id: login

        x: 1670
        y: 48

        height: 70
        width: 166

        Rectangle {
            id: login_rec

            height: 70
            width: 166

            border.color: "#595555"
            border.width: 2
            color: "#ed2b313d"
            radius: 19
        }
        Image {
            id: login_logo

            x: 25
            y: 14

            source: Qt.resolvedUrl("assets/rectangle_4.png")
        }
        Text {
            id: login_text

            x: 72
            y: 20

            height: 36
            width: 76

            color: "#ffffff"
            font.family: "Inter"
            font.letterSpacing: -1.50
            font.pixelSize: 30
            font.weight: Font.Bold
            horizontalAlignment: Text.AlignLeft
            lineHeight: 36
            lineHeightMode: Text.FixedHeight
            text: "Login"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
    }
    Item {
        id: main_menu_text

        x: 481
        y: 183

        height: 262
        width: 1038

        Text {
            id: location_text

            x: 264
            y: 231

            height: 31
            width: 512

            color: "#999999"
            font.family: "Inter"
            font.pixelSize: 26
            font.weight: Font.Bold
            horizontalAlignment: Text.AlignHCenter
            text: "Downtown Location • 123 Cinema Street"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
        }
        Text {
            id: welcome_text

            height: 103
            width: 1039

            color: "#ffffff"
            font.family: "Inter"
            font.pixelSize: 75
            font.weight: Font.Bold
            horizontalAlignment: Text.AlignHCenter
            text: "Welcome to Movix"
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
        Text {
            id: moto_text

            y: 120

            height: 78
            width: 1039

            color: "#ffffff"
            font.family: "Inter"
            font.pixelSize: 32
            font.weight: Font.Light
            horizontalAlignment: Text.AlignHCenter
            text: "Where stories come to life. Experience the gold standard of cinema in every frame."
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
    }
    Item {
        id: options

        x: 109
        y: 538

        height: 1039
        width: 1839

        Rectangle {
            id: option_1

            x: 624
            y: 806

            height: 233
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_2

            x: 1271
            y: 806

            height: 233
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_3

            x: 1283

            height: 317
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_4

            x: 1283

            height: 317
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_5

            x: 636

            height: 317
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_6

            y: 392

            height: 309
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_7

            x: 1271
            y: 392

            height: 309
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_8

            x: 624
            y: 392

            height: 309
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
        Rectangle {
            id: option_9

            y: 806

            height: 233
            width: 556

            border.color: "#fffbfb"
            border.width: 1
            color: "#344255"
            opacity: 0.78
            radius: 74
        }
    }
}