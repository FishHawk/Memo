import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

ApplicationWindow {
    title: qsTr("Configure Memo")
    width: 600
    height: 500
    flags:  Qt.WindowStaysOnTopHint
    modality: Qt.ApplicationModal

    ColumnLayout {
        anchors.fill: parent

        TabBar {
            id: bar
            Layout.fillWidth: true

            Repeater {
                model: ["Apperance", "Editor"]

                TabButton {
                    text: modelData
                    width: Math.max(100, bar.width / model.length)
                }
            }
        }

        StackLayout {
            Layout.margins: 15
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: bar.currentIndex

            ConfigTabApperance {}
            ConfigTabEditor {}
        }
    }

    onVisibleChanged: settings.loadAllSettings()
}