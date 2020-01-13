#include <QtCore/QStandardPaths>
#include <QtCore/QFile>
#include <QtCore/QTextStream>

#include "note_panel.hpp"

NotePanel::NotePanel(int id) {
    m_id = id;
    loadFromFile();
}

void NotePanel::saveToFile() {
    QString dataLocation = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QFile file((dataLocation + "/%1").arg(m_id));
    if (!file.open(QFile::WriteOnly | QFile::Text)) qFatal("???");
    QTextStream out(&file);
    out << m_content;
    file.close();
}

void NotePanel::loadFromFile() {
    QString dataLocation = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QFile file((dataLocation + "/%1").arg(m_id));
    if (!file.open(QFile::ReadWrite | QFile::Text)) qFatal("???");
    QTextStream in(&file);
    m_content = in.readAll();
    file.close();
}
