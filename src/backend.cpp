#include <QAction>

#include <KGlobalAccel>
#include <KLocalizedString>

#include "backend.hpp"

Backend::Backend() {
    int panel_number = loadSetting("panelNumber", 4).toInt();
    panel_number = qMax(panel_number, 1);
    panel_number = qMin(panel_number, 8);
    m_panels = new PanelListModel(panel_number);

    m_actionCollection = new KActionCollection(this);
    QAction *action = m_actionCollection->addAction(QStringLiteral("toggles-state"));
    action->setText(xi18nc("@action", "Open/Retract Memo"));
    KGlobalAccel::self()->setGlobalShortcut(action, QList<QKeySequence>() << QKeySequence(Qt::Key_F10));
    connect(action, SIGNAL(triggered()), this, SIGNAL(stateToggled()));
}