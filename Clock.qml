import QtQuick 2.0

Item {
    id: id_root

    property color bodyColor: "#EFEFF0"

    property int hours: currentDate.getHours()
    property int minutes: currentDate.getMinutes()
    property int seconds: currentDate.getSeconds()
    property var currentDate: new Date()

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true

        onTriggered: id_root.currentDate = new Date()
    }

    Rectangle {
        id: id_plate

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: id_root.bodyColor
        border.color: "#34407D"
        border.width: 22

        Repeater {
            model: 12

            Item {
                id: hourContainer

                property int hour: index
                height: id_plate.height/2
                transformOrigin: Item.Bottom
                rotation: index * 30
                x: id_plate.width/2
                y: 0

                Rectangle {
                    height: id_plate.height*0.1
                    width: height/4
                    radius: width/4
                    color: "#34407D"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 2
                }

                Text {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                    x: 0
                    y: id_plate.height*0.09
                    rotation: 360 - index * 30
                    text: hourContainer.hour == 0 ? 12 : hourContainer.hour
                    font.pixelSize: id_plate.height*0.1
                    font.family: "Gill Sans"
                }

                Text {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                    x: 0
                    y: id_plate.height*0.009
                    rotation: 360 - index * 30
                    text: hourContainer.hour == 0 ? '00' : hourContainer.hour*5
                    font.pixelSize: id_plate.height*0.04
                    font.family: "Gill Sans"
                    color: "white"
                }
            }
        }

        Repeater {
            model: 60
            Item{
                id: minutesContainer

                property int minutes: index
                height: id_plate.height/2
                transformOrigin: Item.Bottom
                rotation: index * 6
                x: id_plate.width/2
                y: 0
                Rectangle {
                    height: id_plate.height*0.04
                    width: height/12
                    radius: width*2
                    color: "#34407D"
                    anchors.top: parent.top
                    anchors.topMargin: 20
                }
            }
        }
    }

    Rectangle {
        id: id_center

        anchors.centerIn: parent
        height: id_plate.height*0.05
        width: height
        radius: width/2
        color: "#6872A5"
    }

    SecondNeedle {
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.seconds
    }

    MinuteNeedle {
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.minutes
    }

    HourNeedle {
        anchors {
            top: id_plate.top
            bottom: id_plate.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.hours
        valueminute: id_root.minutes
    }
}
