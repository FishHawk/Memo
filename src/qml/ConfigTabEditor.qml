import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtQuick.Dialogs 1.3

ColumnLayout {
    id: tab
    spacing: 25
    property int indent: 30

    Label { text: "Panel:" }

    RowLayout {
        Layout.leftMargin: tab.indent
        Layout.fillWidth:true
        spacing: tab.spacing

        Label { text: "Number:" }
        SpinBox {
            Layout.preferredWidth: 60
            value: settings.panelNumber
            from: 1
            to: 8
            onValueChanged: settings.panelNumber = value
        }
    }

    Label { text: "Font:" }

    RowLayout {
        Layout.leftMargin: tab.indent
        Layout.fillWidth:true
        spacing: tab.spacing

        Label { text: "Family:" }
        ComboBox {
            Layout.fillWidth: true
            model: Qt.fontFamilies()
            onActivated: settings.fontFamily = currentText
            Component.onCompleted: currentIndex = find(settings.fontFamily)
        }
        Label { text: "Size:" }
        SpinBox {
            Layout.preferredWidth: 60
            value: settings.fontPixelSize
            from: 4
            to: 30
            onValueChanged: settings.fontPixelSize = value
        }
    }

    Item { Layout.fillHeight: true }

    ConfigFooter {}
}