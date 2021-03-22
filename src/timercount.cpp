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
#include <QMediaPlayer>

//==============================================================
///
/// \brief TimerCount::TimerCount
/// \param parent
///
TimerCount::TimerCount(QObject *parent) : QObject(parent) {
  _timer = new QTimer(this);
  _wTime = 0;
  _remainingTime = 0;
  _cycle = 0;
  _workTime = 5;
  _RecupTime = 5;
  _count = 1;
  _countMax = 1;

  _player = new QMediaPlayer(this);

  _timer->setInterval(1000);
  connect(_timer, &QTimer::timeout, this, &TimerCount::timeOut);
}

//==============================================================
void TimerCount::timeOut() {
  if (_wTime > 0) {
    _wTime--;
    if (_wTime <= 3) {
      if (_wTime == 0) {
        _player->setMedia(QUrl("qrc:/sounds/sound/bip2.mp3"));
        _player->play();
      } else {
        _player->setMedia(QUrl("qrc:/sounds/sound/bip1.mp3"));
        _player->play();
      }
    }
  }

  _timer->setInterval(1000);
  emit timeValue(QVariant(_wTime));

  if (_wTime == 0) {
    _cycle++;

    // Cycle Recuperation
    if (_cycle == 1) {
      _wTime = _RecupTime + 1;
      emit typeSession(QVariant(tr("recuperation")));
    }

    // New Cycle Work or finish ?
    else if (_cycle >= 2) {
      _cycle = 0;
      if (_count >= _countMax) {
        _timer->stop();
        emit finished();
      } else {
        _count++;
        _wTime = _workTime + 1;
        emit typeSession(QVariant(tr("work")));
        emit countValue(QVariant(_count), QVariant(_countMax));
      }
    }
  }
}

//==============================================================
void TimerCount::run() {
  qInfo() << "TimerCount run";

  emit timeValue(QVariant(_wTime));
  emit typeSession(QVariant(tr("work")));
  emit countValue(QVariant(_count), QVariant(_countMax));

  if (_remainingTime > 0)
    _timer->start(_remainingTime);
  else
    _timer->start();
}

//==============================================================
void TimerCount::wait() {
  qInfo() << "TimerCount wait";
  _remainingTime = _timer->remainingTime();
  _timer->stop();
}

//==============================================================
void TimerCount::stop() {
  qInfo() << "TimerCount stop";
  _timer->stop();
  emit finished();
  _wTime = _workTime;
  _remainingTime = 0;
  _cycle = 0;
}

//==============================================================
void TimerCount::setWork(QVariant time) {
  bool ok = false;
  int t = time.toInt(&ok);
  if (ok) {
    _workTime = t;
    _wTime = _workTime;
  }
}

//==============================================================
void TimerCount::setRecup(QVariant time) {
  bool ok = false;
  int t = time.toInt(&ok);
  if (ok) {
    _RecupTime = t;
  }
}

//==============================================================
void TimerCount::setCount(QVariant count) {
  bool ok = false;
  int t = count.toInt(&ok);
  if (ok) {
    _count = 1;
    _countMax = t;
  }
}
