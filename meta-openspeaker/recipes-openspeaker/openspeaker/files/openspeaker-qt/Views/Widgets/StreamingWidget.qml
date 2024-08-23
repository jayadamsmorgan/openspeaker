import QtQuick 2.15
import "../Controls/Buttons"
import "../Controls/Sliders"

Item {
    property real buttonRadius

    Button {
        id: streamingButton

        property bool albumCoverPresent: false

        buttonColor: "red"
        radius: parent.buttonRadius

        anchors {
            bottomMargin: 30
            fill: parent
            leftMargin: 30
            rightMargin: 30
            topMargin: 30
        }
    }

    Button {
        id: albumCoverHolder

        property real padding: 30

        buttonColor: "lightgrey"
        height: streamingButton.height - padding * 2
        radius: parent.buttonRadius
        width: height

        // Actual album cover...
        // Image {
        //
        // }

        anchors {
            left: streamingButton.left
            leftMargin: padding
            verticalCenter: streamingButton.verticalCenter
        }
    }

    Slider {
        width: streamingButton.width / 2.8

        anchors {
            horizontalCenter: playPauseButton.horizontalCenter
            horizontalCenterOffset: -3
            verticalCenter: playPauseButton.verticalCenter
            verticalCenterOffset: -40
        }
    }

    BackwardForwardButton {
        forward: false
        height: playPauseButton.height * 0.6
        radius: 3
        width: height * 2

        anchors {
            horizontalCenter: playPauseButton.horizontalCenter
            horizontalCenterOffset: -playPauseButton.width * 2.5
            verticalCenter: playPauseButton.verticalCenter
        }
    }

    PlayPauseButton {
        id: playPauseButton

        height: streamingButton.height / 8
        pauseButtonRadius: 4
        playButtonRadius: 4
        width: height

        anchors {
            horizontalCenter: streamingButton.horizontalCenter
            horizontalCenterOffset: streamingButton.width / 4
            verticalCenter: albumCoverHolder.bottom
            verticalCenterOffset: -height / 1.5
        }
    }

    BackwardForwardButton {
        height: playPauseButton.height * 0.6
        radius: 3
        width: height * 2

        anchors {
            horizontalCenter: playPauseButton.horizontalCenter
            horizontalCenterOffset: playPauseButton.width * 1.5
            verticalCenter: playPauseButton.verticalCenter
        }
    }
}
