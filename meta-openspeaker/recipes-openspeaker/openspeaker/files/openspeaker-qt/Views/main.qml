import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.VirtualKeyboard 2.15
import "Menus"

Window {
    id: root

    color: "darkslateblue"
    height: 1080
    title: qsTr("openspeaker-qt")
    visible: true
    width: 1920

    MainMenu1 {
        anchors.centerIn: parent
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
