import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "LED Control"

    // Background gradient (black mood)
    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#000000" } // Black
            GradientStop { position: 1.0; color: "#1A1A1A" } // Dark gray
        }
    }

    // LED Control Panel
    Rectangle {
        width: 600
        height: 600
        color: "black" // Darker panel color
        radius: 20
        anchors.centerIn: parent

        // Simulate a shadow using a darker rectangle behind the main rectangle
        Rectangle {
            anchors.fill: parent
            color: "#000000"
            opacity: 0.3
            radius: 20
            z: -1
            anchors.margins: -10
        }

        // Logo at the top-left
        Image {
            id: logo
            source: "file:/usr/share/qt-gpio-app/itilogo.png"  // Path adjusted for framebuffer use
            width: 100  // Smaller logo size
            height: 100
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 20
            fillMode: Image.PreserveAspectFit
        }

        Column {
            anchors.centerIn: parent
            spacing: 20

            // Larger LED Image
            Image {
                id: ledImage
                source: "file:/usr/share/qt-gpio-app/car2off.png"  // Path adjusted for framebuffer use
                width: 150
                height: 150
                scale: 2.0  // Increased size
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }

            // LED Status Text
            Text {
                id: ledStatus
                text: "OFF"
                color: "white"
                font.pixelSize: 24
                font.bold: true
                font.family: "DejaVu Sans"  // Use a common font
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Toggle LED Button
            Button {
                text: "Toggle LED"
                width: 200
                height: 50
                contentItem: Text {
                    text: parent.text
                    color: "black"
                    font.pixelSize: 18
                    font.family: "DejaVu Sans"  // Set font for the button text
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                background: Rectangle {
                    color: "white"
                    radius: 50
                }
                onClicked: {
                    // Toggle LED status
                    if (ledStatus.text === "OFF") {
                        ledStatus.text = "ON"
                        ledStatus.color = "white"
                        ledImage.source = "file:/usr/share/qt-gpio-app/car2on.png"  // Path adjusted for framebuffer use
                    } else {
                        ledStatus.text = "OFF"
                        ledStatus.color = "white"
                        ledImage.source = "file:/usr/share/qt-gpio-app/car2off.png"  // Path adjusted for framebuffer use
                    }

                    controller.toggleLED()  // Call C++ function to toggle LED
                }
            }
        }
    }
}

