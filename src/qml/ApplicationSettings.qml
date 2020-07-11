import QtQuick 2.14

import Backend 1.0

QtObject {
    property double widthPercent
    property double heightPercent
    property double position
    property double animationDuration

    property int panelNumber
    property string fontFamily: "Noto Sans"
    property int fontPixelSize: 18

    function limitRange(value, lowerBound, upperBound) {
        if (value > upperBound) {
            return upperBound
        } else if (value < lowerBound) {
            return lowerBound
        } else {
            return value
        }
    }

    function loadAllSettings() {
        widthPercent = limitRange(Backend.loadSetting("widthPercent", 0.8), 0.1, 1.0)
        heightPercent = limitRange(Backend.loadSetting("heightPercent", 0.5), 0.1, 1.0)
        position = limitRange(Backend.loadSetting("position", 0.5), 0.0, 1.0)
        animationDuration = limitRange(Backend.loadSetting("animationDuration", 200), 0.0, 500.0)

        panelNumber = Backend.loadSetting("panelNumber", 4)
        fontFamily = Backend.loadSetting("fontName", "Noto Sans")
        if (Qt.fontFamilies().indexOf(fontFamily) < 0) {
            fontFamily = "Noto Sans"
        }
        fontPixelSize = limitRange(Backend.loadSetting("fontSize", 18), 4, 30)
    }

    function saveAllSettings() {
        Backend.saveSetting("widthPercent", limitRange(widthPercent, 0.1, 1.0))
        Backend.saveSetting("heightPercent", limitRange(heightPercent, 0.1, 1.0))
        Backend.saveSetting("position", limitRange(position, 0.0, 1.0))
        Backend.saveSetting("animationDuration", limitRange(animationDuration, 0.0, 500.0))

        Backend.saveSetting("panelNumber", limitRange(panelNumber, 1, 8))
        Backend.saveSetting("fontName", fontFamily)
        Backend.saveSetting("fontSize",limitRange(fontPixelSize, 4, 30))
    }

    Component.onCompleted: {
        loadAllSettings()
    }
}