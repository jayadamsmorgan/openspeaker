import QtQuick 2.15
import QtQuick.Window 2.15

Rectangle {
    property color buttonColor

    color: if (buttonMouseArea.containsPress) {
        Qt.darker(buttonColor);
    } else {
        buttonColor;
    }
    radius: 45

    MouseArea {
        id: buttonMouseArea

        anchors.fill: parent
    }
}
