#ifndef BACKEND_HPP
#define BACKEND_HPP

#include <QSettings>
#include <QtCore/QObject>

#include <KActionCollection>

#include "panel_list_model.hpp"

class Backend : public QObject {
    Q_OBJECT

public:
    Q_PROPERTY(PanelListModel *panels READ panels CONSTANT)

    PanelListModel *panels() const { return m_panels; };

signals:
    void stateToggled();

public:
    Backend();

    Q_INVOKABLE QVariant loadSetting(const QString &key, const QVariant &defaultValue = QVariant()) {
        return m_settings.value(key, defaultValue);
    }
    Q_INVOKABLE void saveSetting(const QString &key, const QVariant &value = QVariant()) {
        m_settings.setValue(key, value);
    }

private:
    KActionCollection *m_actionCollection;
    PanelListModel *m_panels;
    QSettings m_settings{"settings"};
};

#endif // BACKEND_HPP