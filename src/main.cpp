#include <QApplication>
#include <QCommandLineParser>
#include <QDir>
#include <QQmlApplicationEngine>
#include <QStandardPaths>

#include "backend.hpp"

static Backend *backend;
static QObject *getBackend(QQmlEngine *, QJSEngine *) { return backend; }

int main(int argc, char *argv[]) {
    // initialize application
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QApplication::setApplicationName("memo");
    QApplication::setApplicationDisplayName("Memo");
    QApplication::setApplicationVersion("0.1.0");
    QApplication::setWindowIcon(QIcon::fromTheme("note"));

    // initialize data and config dir
    QString dataLocation = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    QString configLocation = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
    for (const QString &location : {dataLocation, configLocation})
        if (!QDir(location).mkpath("."))
            qFatal("Could not create dir: %s", qPrintable(location));

    // set config path
    QSettings::setPath(QSettings::defaultFormat(), QSettings::UserScope,
                       QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation));

    // create c++ backend
    backend = new Backend();

    // expose c++ backend to qml
    QQmlApplicationEngine::setObjectOwnership(backend, QQmlEngine::CppOwnership);
    qmlRegisterSingletonType<Backend>("Backend", 1, 0, "Backend", getBackend);

    // load qml
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/MainWindow.qml")));

    return QApplication::exec();
}
