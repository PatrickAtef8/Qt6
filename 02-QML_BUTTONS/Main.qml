import QtQuick
import QtQuick.Controls

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    color:"black"

    Grid {
        columns: 2
        spacing: 100
        anchors.centerIn: parent

        Repeater {
            model: 4
            Rectangle {
                id: rectangle
                width: 400
                height: 400
                color: "black"
                border.color: "lightgray"

                property int imageIndex: index

                Image {
                    id: img1
                    source: "file:car1.png"
                    width: 400
                    height: 400
                    anchors.centerIn: parent
                    visible: false
                }
                Image {
                    id: img2
                    source: "file:car2.jpg"
                    width: 400
                    height: 400
                    anchors.centerIn: parent
                    visible: false
                }
                Image {
                    id: img3
                    source: "file:car3.jpg"
                    width: 400
                    height: 400
                    anchors.centerIn: parent
                    visible: false
                }
                Image {
                    id: img4
                    source: "file:car4.jpg"
                    width: 400
                    height: 400
                    anchors.centerIn: parent
                    visible: false
                }

                Column {
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10

                    Button {
                        text: "Show"
                        onClicked: {
                            if (imageIndex === 0) img1.visible = true;
                            else if (imageIndex === 1) img2.visible = true;
                            else if (imageIndex === 2) img3.visible = true;
                            else if (imageIndex === 3) img4.visible = true;
                        }
                    }
                    Button {
                        text: "Hide"
                        onClicked: {
                            if (imageIndex === 0) img1.visible = false;
                            else if (imageIndex === 1) img2.visible = false;
                            else if (imageIndex === 2) img3.visible = false;
                            else if (imageIndex === 3) img4.visible = false;
                        }
                    }
                }
            }
        }
    }
}
