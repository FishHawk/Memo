#include "panel_list_model.hpp"

PanelListModel::PanelListModel(int size) {
    m_size = size;

    for (int i = 0; i < m_size; ++i) {
        m_panels.append(new NotePanel(i));
    }
}