import QtQuick 2.15
import "../../Canvas"

Item {
    id: playPauseButton

    property color buttonColor: "white"
    property real pauseButtonRadius: playButtonRadius
    property bool paused: true
    property real playButtonRadius: 5

    signal clicked

    height: 50
    width: 50

    Behavior on paused {
        SmoothedAnimation {
        }
    }

    PolyCanvas {
        id: playButton

        color: playButtonMouseArea.containsPress ? Qt.darker(parent.buttonColor) : parent.buttonColor
        height: parent.height
        radius: parent.playButtonRadius
        rotation: -90
        visible: parent.paused
        width: parent.width

        MouseArea {
            id: playButtonMouseArea

            anchors.fill: parent

            onClicked: {
                playPauseButton.paused = false;
                playPauseButton.clicked();
            }
        }
    }

    Rectangle {
        id: pauseButton

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        color: "transparent"
        height: parent.height * 0.8
        visible: !parent.paused
        width: parent.width * 0.8

        Rectangle {
            color: pauseButtonMouseArea.containsPress ? Qt.darker(playPauseButton.buttonColor) : playPauseButton.buttonColor
            height: parent.height
            radius: playPauseButton.pauseButtonRadius
            width: parent.width / 3

            anchors {
                left: parent.left
            }
        }

        Rectangle {
            color: pauseButtonMouseArea.containsPress ? Qt.darker(playPauseButton.buttonColor) : playPauseButton.buttonColor
            height: parent.height
            radius: playPauseButton.pauseButtonRadius
            width: parent.width / 3

            anchors {
                right: parent.right
            }
        }

        MouseArea {
            id: pauseButtonMouseArea

            anchors.fill: parent

            onClicked: {
                playPauseButton.paused = true;
                playPauseButton.clicked();
            }
        }
    }
}
