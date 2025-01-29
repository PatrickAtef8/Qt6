import QtQuick 2.15

Window {
    visible: true
    width: 640
    height: 480
    title:qsTr("PETO🔥")

    Rectangle {
        width: parent.width
        height: parent.height
        color: "#EAEAEA"

        Rectangle {
            width: 620
            height: 150
            anchors.centerIn: parent
            color: "#FFFFFF"
            border.color: "#A9A9A9"
            border.width: 2
            radius: 10


            Rectangle {
                width: 100
                height: 100
                x: 10
                y: (parent.height - height) / 2
                color: "#4B4B4B"
                border.color: "#2F2F2F"
                border.width: 4
                radius: 15

                Text {
                    anchors.centerIn: parent
                    text: "P"
                    color: "white"
                    font.pixelSize: 50
                }
            }
            Rectangle {
                width: 100
                height: 100
                x: 130
                y: (parent.height - height) / 2
                color: "#505050"
                border.color: "#2C3E50"
                border.width: 4
                radius: 15

                Text {
                    anchors.centerIn: parent
                    text: "E"
                    color: "white"
                    font.pixelSize: 50
                }
            }


            Rectangle {
                width: 100
                height: 100
                x: 250
                y: (parent.height - height) / 2
                color: "#505050"
                border.color: "#323232"
                border.width: 4
                radius: 15

                Text {
                    anchors.centerIn: parent
                    text: "T"
                    color: "white"
                    font.pixelSize: 50
                }
            }


            Rectangle {
                width: 100
                height: 100
                x: 370
                y: (parent.height - height) / 2
                color: "#444444"
                border.color: "#232323"
                border.width: 4
                radius: 15

                Text {
                    anchors.centerIn: parent
                    text: "O"
                    color: "white"
                    font.pixelSize: 50
                }
            }


            Rectangle {
                width: 100
                height: 100
                x: 490
                y: (parent.height - height) / 2
                color: "#FFFFFF"
                border.color: "#2F2F2F"
                border.width: 4
                radius: width / 2
                clip: true

                Text {
                    anchors.centerIn: parent
                    text: "🔥"
                    font.pixelSize: 50
                }
            }
        }
    }
}
