import QtQuick 2.0

Item {
    id: id_root
    property int value: 0
    property int valueminute: 0
    property int granularity: 12

    property real hours: 0

    Rectangle {
        id: hoursHandle
        width: 6
        height: id_root.height * 0.24
        color: "#6872A5"
        anchors {
            horizontalCenter: id_root.horizontalCenter
            bottom: id_root.verticalCenter
        }
        antialiasing: true

        MouseArea {
            anchors.fill: parent
            drag.target: parent
            onPositionChanged: {
                var angle = Math.atan2(height / 2 - y, x - width / 2);
                var degrees = angle * 180 / Math.PI;
                // id_root.value = Math.round((180 - degrees) / 30) % 12;
                id_root.hours = 180 - degrees / 30;
                id_root.value = Math.round(degrees / (180 / id_root.granularity)) % id_root.granularity;
            }
        }
    }

    rotation: 360/granularity * (value%granularity) + 360/granularity * (valueminute / 60)
    antialiasing: true

}

