#ifndef NOTE_PANEL_HPP
#define NOTE_PANEL_HPP

#include <QtCore/QDebug>
#include <QtCore/QObject>

class NotePanel : public QObject {
Q_OBJECT

public:
    Q_PROPERTY(QString content READ content WRITE setContent NOTIFY contentChanged)

    explicit NotePanel(int id);

    QString content() { return m_content; }

    void setContent(QString content) {
        m_content = std::move(content);
        saveToFile();
    }

signals:
    void contentChanged();

private:
    void saveToFile();
    void loadFromFile();

    int m_id;
    QString m_content;
};

#endif // NOTE_PANEL_H