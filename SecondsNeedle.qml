import QtQuick 2.0

Item {
    id: id_root
    property int value: 0
    property int granularity: 60

    Rectangle {
        width: 2
        height: id_root.height * 0.50
        color: "red"
        anchors {
            horizontalCenter: id_root.horizontalCenter
        }
        antialiasing: true
        y: id_root.height * 0.12
    }

    rotation: 360/granularity * (value % granularity)
    antialiasing: true
}
