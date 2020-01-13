import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtGraphicalEffects 1.0

import Backend 1.0

ApplicationWindow {
    id: mainWindow

    x: Screen.desktopAvailableWidth * (1 - settings.widthPercent) * settings.position
    y: 0

    width: Screen.desktopAvailableWidth * settings.widthPercent
    height: Screen.desktopAvailableHeight * settings.heightPercent

    visible: true
    flags:  Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    color: "transparent"

    SystemPalette {
        id: palette
        colorGroup: SystemPalette.Active
    }

    ApplicationSettings {
        id: settings
    }

    Connections {
        target: Backend
        onStateToggled: {
            if (!mainWindow.visible) { animaShow.restart() }
            else { animaHide.restart() }
        }
    }
    onActiveChanged: { if (!active && mainWindow.visible && !controlPanel.pined) { animaHide.restart() } }

    ParallelAnimation {
        id: animaShow
        running: false

        NumberAnimation { target: mainPanel; property: "y"; from: -200; to: 0; duration: settings.animationDuration }
        OpacityAnimator { target: mainWindow.contentItem;  from: 0; to: 1; duration: settings.animationDuration }

        onStarted: {
            mainWindow.show()
            mainWindow.requestActivate()
        }
    }

    ParallelAnimation {
        id: animaHide
        running: false
        NumberAnimation { target: mainPanel; property: "y"; from: 0; to: -200; duration: settings.animationDuration }
        OpacityAnimator { target: mainWindow.contentItem; from: 1; to: 0; duration: settings.animationDuration }

        onFinished: {
            mainWindow.visible = false
            mainWindow.hide()
        }
    }

    ColumnLayout {
        id: mainPanel
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height - 5
        spacing: 0

        NotePanel {
            id: memoPanel
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: palette.window
        }

        ControlPanel {
            id: controlPanel
            Layout.fillWidth: true
            Layout.preferredHeight: 30
            color: palette.midlight
        }
    }

    DropShadow {
        anchors.fill: mainPanel
        horizontalOffset: 0
        verticalOffset: 2
        radius: 3
        samples: 7
        source: mainPanel
        color: "black"
    }
}