import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Layouts 2.15
import "Controls/Buttons"
import "Controls/Sliders"

Window {
    id: root

    color: "darkslateblue"
    height: 1080
    title: qsTr("openspeaker-qt")
    visible: true
    width: 1920

    Rectangle {
        id: mainMenu1

        anchors.centerIn: parent
        color: "lightblue"
        height: parent.height / 1.5
        radius: 45
        width: parent.width / 1.5

        GridLayout {
            anchors.fill: parent
            columnSpacing: 10
            columns: 2
            rowSpacing: 10
            rows: 2

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Button {
                    id: streamingButton

                    property bool albumCoverPresent: false

                    buttonColor: "red"

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
                    height: playPauseButton.height * 0.8
                    width: height * 2

                    anchors {
                        horizontalCenter: playPauseButton.horizontalCenter
                        horizontalCenterOffset: -playPauseButton.width * 2.5
                        verticalCenter: playPauseButton.verticalCenter
                    }
                }

                PlayPauseButton {
                    id: playPauseButton

                    height: streamingButton.height / 7
                    pauseButtonRadius: 5
                    playButtonRadius: 5
                    width: height

                    anchors {
                        horizontalCenter: streamingButton.horizontalCenter
                        horizontalCenterOffset: streamingButton.width / 4
                        verticalCenter: albumCoverHolder.bottom
                        verticalCenterOffset: -height / 1.5
                    }
                }

                BackwardForwardButton {
                    height: playPauseButton.height * 0.8
                    width: height * 2

                    anchors {
                        horizontalCenter: playPauseButton.horizontalCenter
                        horizontalCenterOffset: playPauseButton.width * 1.5
                        verticalCenter: playPauseButton.verticalCenter
                    }
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    InputPanel {
        id: inputPanel

        width: root.width
        x: 0
        y: root.height
        z: 99

        states: State {
            name: "visible"
            when: inputPanel.active

            PropertyChanges {
                target: inputPanel
                y: root.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            reversible: true
            to: "visible"

            ParallelAnimation {
                NumberAnimation {
                    duration: 250
                    easing.type: Easing.InOutQuad
                    properties: "y"
                }
            }
        }
    }
}
