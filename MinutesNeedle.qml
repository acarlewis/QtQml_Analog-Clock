import QtQuick 2.0

Item {
    id: id_root
    property int value: 0
    property int granularity: 60

    width: 4;
    height: 12;
    property real centerX : (width / 2);
    property real centerY : (height / 2);

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

            anchors.fill: parent;
            drag.target: parent;
            onPositionChanged: (mouse)=> {
                var point =  mapToItem (id_root, mouse.x, mouse.y);
                var diffX = (point.x - id_root.centerX);
                var diffY = -1 * (point.y - id_root.centerY);
                var rad = Math.atan (diffY / diffX);
                var deg = (rad * 180 / Math.PI);
                if (diffX > 0 && diffY > 0) {
                    id_root.rotation = 90 - Math.abs (deg);
                }
                else if (diffX > 0 && diffY < 0) {
                    id_root.rotation = 90 + Math.abs (deg);
                }
                else if (diffX < 0 && diffY > 0) {
                    id_root.rotation = 270 + Math.abs (deg);
                }
                else if (diffX < 0 && diffY < 0) {
                    id_root.rotation = 270 - Math.abs (deg);
                }
            }



        }
    }

    rotation: 360/granularity * (value % granularity)
    antialiasing: true
}
