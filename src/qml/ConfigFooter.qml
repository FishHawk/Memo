import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

RowLayout {
    Layout.fillWidth: true

    Item { Layout.fillWidth: true }

    Button {
        text: qsTr("OK")
        onClicked: {
            settings.saveAllSettings()
            configWindow.visible = false
        }
    }

    Button {
        text: qsTr("Cancel")
        onClicked: {
            configWindow.visible = false
        }
    }
}