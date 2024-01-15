import QtQuick 2.0

Item {
    id: id_root
    property int value: 0
    property int granularity: 60

    Rectangle {
        id: minutesHandle
        width: 4
        height: id_root.height * 0.32
        color: "#6872A6"
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
                // clock.minutes = 30 - degrees / 6;
                id_root.value = Math.round(degrees / (360 / id_root.granularity)) % id_root.granularity;
            }
        }
    }

    rotation: 360/granularity * (value % granularity)
    antialiasing: true
}
