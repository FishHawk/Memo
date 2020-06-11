import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    ScrollView {
        anchors.fill: parent

        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOn

        TextArea {
            text: item.content
            padding: 20

            selectByMouse: true
            wrapMode: TextEdit.Wrap
            font.family: settings.fontFamily
            font.pixelSize: settings.fontPixelSize

            onEditingFinished: {
                item.content = text
            }
        }
    }
}