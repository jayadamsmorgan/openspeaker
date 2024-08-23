import QtQuick 2.15

Rectangle {
    property color buttonColor

    signal clicked

    color: buttonMouseArea.containsPress ? Qt.darker(buttonColor) : buttonColor
    radius: 45

    MouseArea {
        id: buttonMouseArea

        anchors.fill: parent

        onClicked: {
            parent.clicked();
        }
    }
}
