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

#include "timercount.h"
#include <QDebug>

//==============================================================
///
/// \brief TimerCount::TimerCount
/// \param parent
///
TimerCount::TimerCount(QObject *parent) : QObject(parent) {
  _timer = new QTimer(this);
  _time = 0;
  _workTime = 5;
  _RecupTime = 5;
  _count = 1;

  _timer->setInterval(1000);
  connect(_timer, &QTimer::timeout, this, &TimerCount::timeOut);
}

//==============================================================
void TimerCount::timeOut() {
  if (_time > 0) {
    _time--;
  }

  emit timeValue(QVariant(_time));

  if (_time == 0) {
    _timer->stop();
    emit finished();
  }
}

//==============================================================
void TimerCount::run() {
  qInfo() << "TimerCount run";
  emit timeValue(QVariant(_time));
  _timer->start();
}

//==============================================================
void TimerCount::wait() {
  qInfo() << "TimerCount wait";
  _timer->stop();
}

//==============================================================
void TimerCount::stop() {
  qInfo() << "TimerCount stop";
  _timer->stop();
  emit finished();
  _time = _workTime;
}
