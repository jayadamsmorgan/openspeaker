import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import QtQuick.Layouts 2.15

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

                    property real padding: 60

                    buttonColor: "white"
                    height: streamingButton.height - padding
                    width: streamingButton.width / 2 - padding

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            console.log("WOW!");
                        }
                    }

                    anchors {
                        centerIn: parent
                        horizontalCenterOffset: -(width + padding) / 2
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
