#ifndef SYSTEMINFO_H
#define SYSTEMINFO_H
#pragma once

#include <QObject>

class SystemInfo : public QObject
{
  Q_OBJECT
public:
  explicit SystemInfo(QObject *parent = nullptr);

public slots:
  ///
  /// \brief SystemInfo::qtBuild
  /// \return QString
  ///
  QString qtBuild();

  ///
  /// \brief qtVersion
  /// \return QString
  ///
  QString qtVersion();

  ///
  /// \brief machineHost
  /// \return QString
  ///
  QString machineHostName();

  ///
  /// \brief machineHostOs
  /// \return QString
  ///
  QString machineHostOs();
};

#endif // SYSTEMINFO_H
