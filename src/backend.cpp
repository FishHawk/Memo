#include <QAction>

#include <KGlobalAccel>
#include <KLocalizedString>

#include "backend.hpp"

Backend::Backend() {
    m_panels = new PanelListModel(4);

    m_actionCollection = new KActionCollection(this);
    QAction *action = m_actionCollection->addAction(QStringLiteral("toggles-state"));
    action->setText(xi18nc("@action", "Open/Retract Memo"));
    KGlobalAccel::self()->setGlobalShortcut(action, QList<QKeySequence>() << QKeySequence(Qt::Key_F10));
    connect(action, SIGNAL(triggered()), this, SIGNAL(stateToggled()));
}