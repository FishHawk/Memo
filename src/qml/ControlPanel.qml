import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

import Backend 1.0

Rectangle {
    id: controlPanel

    property bool pined: false

    ConfigWindow {
        id: configWindow
        visible: false
    }

    RowLayout {
        anchors.fill: parent
        spacing: 1

        Item { Layout.fillWidth: true }

        Button {
            Layout.preferredWidth: 25
            Layout.preferredHeight: 25
            icon.width: 20
            icon.height: 20
            icon.name: "pin"
            highlighted: true
            onClicked: pined = !pined

            Rectangle {
                anchors.fill: parent
                visible: controlPanel.pined
                color: "#80808080"
            }
        }

        Button {
            Layout.preferredWidth: 25
            Layout.preferredHeight: 25
            icon.width: 20
            icon.height: 20
            icon.name: "configure"
            onClicked: configWindow.visible = true
        }

        Button {
            Layout.preferredWidth: 25
            Layout.preferredHeight: 25
            icon.width: 30
            icon.height: 30
            icon.name: "window-close"
            onClicked: mainWindow.close()
        }
    }
}