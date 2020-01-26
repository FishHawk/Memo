set(CMAKE_CXX_STANDARD 14)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(QT_MIN_VERSION "5.14.0")
find_package(Qt5 ${QT_MIN_VERSION} COMPONENTS REQUIRED
        Core
        Widgets
        Quick
        QuickControls2)

find_package(ECM 1.0.0 REQUIRED NO_MODULE)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(KF5_MIN_VERSION "5.2.0")
find_package(KF5 ${KF5_MIN_VERSION} REQUIRED COMPONENTS
        I18n
        XmlGui
        DBusAddons
        GlobalAccel)

add_executable(memo
        qml/qml.qrc
        main.cpp
        backend.cpp
        panel_list_model.cpp
        note_panel.cpp)

target_compile_definitions(memo PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(memo
        PRIVATE
        Qt5::Core
        Qt5::Widgets
        Qt5::Quick
        Qt5::QuickControls2

        KF5::I18n
        KF5::XmlGui
        KF5::GlobalAccel
        KF5::DBusAddons)