import QtQuick 2.14
import QtQuick.Controls 2.14

Item {
    property int selectStart
    property int selectEnd
    property int curPos

    ScrollView {
        anchors.fill: parent

        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOn

        TextArea {
            id: textInput
            text: item.content
            padding: 20

            selectByMouse: true
            wrapMode: TextEdit.Wrap
            font.family: settings.fontFamily
            font.pixelSize: settings.fontPixelSize

            onEditingFinished: {
                item.content = text
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                hoverEnabled: true
                onPressed: {
                    if (containsMouse) {
                        selectStart = textInput.selectionStart;
                        selectEnd = textInput.selectionEnd;
                        curPos = textInput.cursorPosition;
                        contextMenu.popup(mouse.x, mouse.y);
                    }
                }

                Menu {
                    id: contextMenu
                    onOpened: {
                        textInput.cursorPosition = curPos;
                        textInput.select(selectStart,selectEnd);
                    }
                    Action {
                        text: qsTr("Cut")
                        icon.name: "edit-cut"
                        enabled: selectStart != selectEnd
                        onTriggered: textInput.cut()
                    }
                    Action {
                        text: qsTr("Copy")
                        icon.name: "edit-copy"
                        enabled: selectStart != selectEnd
                        onTriggered: textInput.copy()
                    }
                    Action {
                        text: qsTr("Paste")
                        icon.name: "edit-paste"
                        onTriggered: textInput.paste()
                    }
                }
            }
        }
    }
}