#ifndef PANEL_LIST_MODEL_HPP
#define PANEL_LIST_MODEL_HPP

#include "note_panel.hpp"

#include <QAbstractListModel>

class PanelListModel : public QAbstractListModel {
Q_OBJECT

public:
    Q_PROPERTY(int size READ size CONSTANT)

    explicit PanelListModel(int size);

    int size() { return m_size; }

    int rowCount(const QModelIndex &) const override {
        return m_panels.size();
    }

    QVariant data(const QModelIndex &index, int) const override {
        if (!index.isValid() || index.row() < 0 || index.row() >= m_panels.size())
            return QVariant();
        return QVariant::fromValue(m_panels.at(index.row()));
    }

protected:
    QHash<int, QByteArray> roleNames() const override {
        QHash<int, QByteArray> roles;
        roles[Qt::UserRole + 1] = "item";
        return roles;
    };

private:
    int m_size;
    QList<NotePanel *> m_panels;
};

#endif // PANEL_LIST_MODEL_H