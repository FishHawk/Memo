import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14

ColumnLayout {
    id: tab
    spacing: 25
    property int indent: 30

    Label { text: "Size:" }

    RowLayout {
        Layout.leftMargin: tab.indent
        Layout.fillWidth:true
        spacing: tab.spacing

        Label { Layout.preferredWidth: 70; text: "Width:" }
        Slider {
            Layout.fillWidth: true
            from: 0.1; to: 1; stepSize: 0.1
            value: settings.widthPercent
            onValueChanged: settings.widthPercent = value
        }
        Label {
            Layout.preferredWidth: 40
            text: settings.widthPercent * 100 + '%'
            horizontalAlignment: Text.AlignRight
        }
    }

    RowLayout {
        Layout.leftMargin: tab.indent
        Layout.fillWidth:true
        spacing: tab.spacing

        Label { Layout.preferredWidth: 70; text: "Height:" }
        Slider {
            Layout.fillWidth: true
            from: 0.1; to: 1; stepSize: 0.1
            value: settings.heightPercent
            onValueChanged: settings.heightPercent = value
        }
        Label {
            Layout.preferredWidth: 40
            text: settings.heightPercent * 100 + '%'
            horizontalAlignment: Text.AlignRight
        }
    }

    Label { text: "Position:" }

    RowLayout {
        Layout.leftMargin: tab.indent
        Layout.fillWidth:true
        spacing: tab.spacing

        Label { text: "Left" }
        Slider {
            Layout.fillWidth: true
            from: 0; to: 1; stepSize: 0.1
            value: settings.position
            onValueChanged: settings.position = value
        }
        Label { text: "Right" }
    }

    Label { text: "Animation:" }

    RowLayout {
        Layout.leftMargin: tab.indent
        Layout.fillWidth:true
        spacing: tab.spacing

        Label { Layout.preferredWidth: 70; text: "Duration:" }
        Slider {
            Layout.fillWidth: true
            from: 0; to: 500; stepSize: 10
            value: settings.animationDuration
            onValueChanged: settings.animationDuration = value
        }
        Label {
            Layout.preferredWidth: 40
            text: settings.animationDuration + 'ms'
            horizontalAlignment: Text.AlignRight
        }
    }

    Item { Layout.fillHeight: true }

    ConfigFooter {}
}