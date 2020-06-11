import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import Backend 1.0

Rectangle {
    id: memoPanel

    Row {
        anchors.fill: parent
        spacing: 1
        Repeater {
            model: Backend.panels
            Note { width: memoPanel.width / Backend.panels.size; height: memoPanel.height }
        }
    }
}