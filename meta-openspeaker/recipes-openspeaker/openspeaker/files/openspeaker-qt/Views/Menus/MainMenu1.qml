import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../Widgets"

Rectangle {
    id: mainMenu1

    color: "lightblue"
    height: parent.height / 1.5
    radius: height / 26
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

            StreamingWidget {
                anchors.fill: parent
                buttonRadius: mainMenu1.radius
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
