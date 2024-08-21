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
        anchors.centerIn: parent
        color: "lightblue"
        height: 720
        radius: height / 6
        width: 1280

        GridLayout {
            anchors.fill: parent
            columnSpacing: 10
            columns: 2
            rowSpacing: 10
            rows: 2

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Rectangle {
                    id: streamingButton

                    property bool albumCoverPresent: false
                    property color buttonColor: "red"

                    color: if (buttonMouseArea.containsPress) {
                        return Qt.darker(buttonColor);
                    } else {
                        return buttonColor;
                    }
                    radius: height / 6

                    Rectangle {
                        color: "white"
                        height: parent.height - 20
                        radius: height / 6
                        width: parent.width / 2 - 20

                        anchors {
                            left: parent.left
                            leftMargin: 10
                            top: parent.top
                            topMargin: 10
                        }
                    }

                    anchors {
                        bottomMargin: 30
                        fill: parent
                        leftMargin: 30
                        rightMargin: 30
                        topMargin: 30
                    }

                    MouseArea {
                        id: buttonMouseArea

                        anchors.fill: parent

                        onClicked: {}
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
