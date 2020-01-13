import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import Backend 1.0

Rectangle {
    id: memoPanel

    Repeater {
        model: Backend.panels.size - 1
        Rectangle {
            x: (index + 1) * memoPanel.width / (Backend.panels.size)
            y: 0
            width: 1
            height: memoPanel.height
            color: palette.dark
        }
    }

    Row {
        anchors.fill: parent
        spacing: 1
        Repeater {
            model: Backend.panels
            Note { width: memoPanel.width / Backend.panels.size; height: memoPanel.height }
        }
    }
}