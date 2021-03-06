/**
    Copyright (C)2021 Cyril Frausti
    This file is part of JumpRope.

    JumpRope is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JumpRope is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JumpRope.  If not, see <https://www.gnu.org/licenses/>.
*/

#include <QDebug>
#include <QDir>
#include <QFontDatabase>
#include <QGuiApplication>
#include <QLibraryInfo>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>

#ifdef Q_OS_ANDROID
#include <QAndroidJniEnvironment>
#include <QtAndroid>
#endif

#include "systeminfo.h"
#include "timercount.h"

///
/// \brief main
/// \param argc
/// \param argv
/// \return
///
int main(int argc, char *argv[]) {

  // Application attributes
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

  // Register a type in QML of SystemInfo class
  qmlRegisterType<SystemInfo>("cfdev.SystemInfo", 1, 0, "SystemInfo");

  // If android
#ifdef Q_OS_ANDROID
  QAndroidJniObject activity = QtAndroid::androidActivity();
  if (activity.isValid()) {

    // getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    QAndroidJniObject window = activity.callObjectMethod("getWindow", "()Landroid/view/Window;");
    if (window.isValid()) {
      const int FLAG_KEEP_SCREEN_ON = 128;
      window.callMethod<void>("addFlags", "(I)V", FLAG_KEEP_SCREEN_ON);
    }

    // Clear any possible pending exceptions from FLAG_KEEP_SCREEN_ON.
    QAndroidJniEnvironment env;
    if (env->ExceptionCheck()) {
      env->ExceptionClear();
    }
  }
#endif

  // Application
  QGuiApplication app(argc, argv);

  // Translation application
  QTranslator translatorApp;
  QString locale = QLocale::system().name();
  int pos = locale.indexOf('_');
  if (pos > 0) {
    locale = locale.mid(0, pos);
  }

  // Load the tranduction file
  if (!translatorApp.load(":/lang/JumpRope_" + locale)) {
    // if error
    qCritical() << "Fail to load traduction file, Use the english language instead ";
  }
  app.installTranslator(&translatorApp);

  // Fonts
  if (QFontDatabase::addApplicationFont(":/fonts/design/fonts/OpenSans-SemiBold.ttf"))
    qCritical() << "Fail to add font ";

  // QML Engine
  QQmlApplicationEngine engine;

  // Add to the root context
  TimerCount mTimer;
  engine.rootContext()->setContextProperty("timerCount", &mTimer);

  // The URL of the QML main file from ressource
  const QUrl url(QStringLiteral("qrc:/src/qml/main.qml"));

  // Connecting signal and slot for making sure the object and url match
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);

  // The engine load QML file
  engine.load(url);

  // Run application
  return QGuiApplication::exec();
}
