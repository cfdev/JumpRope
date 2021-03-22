#ifndef TimerCount_H
#define TimerCount_H
#pragma once

#include <QMediaPlayer>
#include <QObject>
#include <QTimer>
#include <QVariant>

///
/// \brief The TimerCount class
///
class TimerCount : public QObject {
  Q_OBJECT

public:
  explicit TimerCount(QObject *parent = nullptr);

signals:
  ///
  /// \brief timeValue
  /// \param time
  ///
  void timeValue(QVariant time);

  ///
  /// \brief countValue
  /// \param count
  /// \param max
  ///
  void countValue(QVariant count, QVariant max);

  ///
  /// \brief typeSession
  /// \param type
  ///
  void typeSession(QVariant type);

  ///
  /// \brief finished
  ///
  void finished();

public slots:
  ///
  /// \brief setWork
  /// \param time
  ///
  void setWork(QVariant time);

  ///
  /// \brief setRecup
  /// \param time
  ///
  void setRecup(QVariant time);

  ///
  /// \brief setCount
  /// \param count
  ///
  void setCount(QVariant count);

  ///
  /// \brief run
  ///
  void run();

  ///
  /// \brief wait
  ///
  void wait();

  ///
  /// \brief stop
  ///
  void stop();

private slots:
  ///
  /// \brief timeOut
  ///
  void timeOut();

private:
  QTimer *_timer;
  int _wTime;
  int _workTime, _RecupTime;
  int _cycle;
  int _count, _countMax;
  int _remainingTime;

  QMediaPlayer *_player;
};

#endif // TimerCount_H
