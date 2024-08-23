import QtQuick 2.15
import QtQuick.Controls 2.15

Slider {
    id: control

    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitHandleHeight + topPadding + bottomPadding)
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitHandleWidth + leftPadding + rightPadding)
    padding: 6
    spacing: 3
    stepSize: 0.01

    background: Rectangle {
        color: "darkgrey"
        height: control.horizontal ? implicitHeight : control.availableHeight
        implicitHeight: control.horizontal ? 8 : 200
        implicitWidth: control.horizontal ? 200 : 8
        radius: width
        width: control.horizontal ? control.availableWidth : implicitWidth
        x: (control.width - width) / 2
        y: (control.height - height) / 2
    }

    Rectangle {
        implicitHeight: control.vertical ? control.visualPosition * (control.availableHeight) : control.pressed ? 10 : 8
        implicitWidth: control.horizontal ? control.visualPosition * (control.availableWidth) : control.pressed ? 10 : 8
        radius: width / 2
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.vertical ? 0 : (control.availableHeight - height) / 2)

        Behavior on height {
            SmoothedAnimation {
            }
        }
        Behavior on width {
            SmoothedAnimation {
            }
        }
    }
}
