import QtQuick 2.15
import "../../Canvas"

Rectangle {
    id: forwardBackwardButton

    property color buttonColor: "white"
    property bool forward: true
    property real radius: 5

    signal clicked

    color: "transparent"
    height: 50
    width: 100

    Item {
        anchors.centerIn: parent
        height: parent.height
        width: parent.width

        PolyCanvas {
            id: first

            color: playButtonMouseArea.containsPress ? Qt.darker(forwardBackwardButton.buttonColor) : forwardBackwardButton.buttonColor
            height: parent.height
            radius: forwardBackwardButton.radius
            rotation: forwardBackwardButton.forward ? -90 : 90
            width: parent.width / 2

            anchors {
                left: parent.left
            }
        }

        Item {
            height: parent.height
            width: parent.width / 2

            PolyCanvas {
                color: playButtonMouseArea.containsPress ? Qt.darker(forwardBackwardButton.buttonColor) : forwardBackwardButton.buttonColor
                height: parent.height
                radius: forwardBackwardButton.radius
                rotation: forwardBackwardButton.forward ? -90 : 90
                width: parent.width
            }

            anchors {
                left: first.right
                leftMargin: -forwardBackwardButton.radius * 1.4
            }
        }

        MouseArea {
            id: playButtonMouseArea

            anchors.fill: parent

            onClicked: {
                forwardBackwardButton.clicked();
            }
        }
    }
}
