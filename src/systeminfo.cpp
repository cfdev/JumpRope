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

#include "systeminfo.h"
#include <QSysInfo>

//==============================================================
SystemInfo::SystemInfo(QObject *parent) : QObject(parent) {}

//==============================================================
QString SystemInfo::qtBuild() { return QSysInfo::buildAbi(); }

//==============================================================
QString SystemInfo::qtVersion() {
  QString mess = tr("Build ") + QString(QT_VERSION_STR) + " - " + tr("Work on ") + QString(qVersion());

  return mess;
}

//==============================================================
QString SystemInfo::machineHostName() { return QSysInfo::machineHostName(); }

//==============================================================
QString SystemInfo::machineHostOs() {
  QString msg =
      QSysInfo::productType() + " " + QSysInfo::productVersion() + "<br>(" + QSysInfo::kernelVersion() + ") " + QSysInfo::currentCpuArchitecture();

  return msg;
}
