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
#include <QQmlApplicationEngine>

///
/// \brief main
/// \param argc
/// \param argv
/// \return
///
int main(int argc, char *argv[])
{
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QGuiApplication app(argc, argv);

  // Fonts
  if (QFontDatabase::addApplicationFont(":/fonts/design/fonts/OpenSans-SemiBold.ttf"))
    qCritical() << "Fail to add font ";

  // QML
  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/src/qml/main.qml"));
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
      &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      }, Qt::QueuedConnection);
  engine.load(url);

  return QGuiApplication::exec();
}
