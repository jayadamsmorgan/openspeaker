import QtQuick 2.15
import QtQuick.Controls 2.15

Slider {
    id: slider

    from: 0
    height: 9
    stepSize: 1
    to: 100
    width: 100

    background: Rectangle {
        anchors.fill: parent
        color: "lightgrey"
        radius: 10
    }
    handle: Rectangle {
        color: "white"
        height: 10
        radius: 10
        width: slider.width / 100 * slider.value

        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
    }
}
