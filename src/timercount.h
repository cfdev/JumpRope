#ifndef TimerCount_H
#define TimerCount_H

#include <QObject>
#include <QTimer>
#include <QVariant>

class TimerCount : public QObject {
  Q_OBJECT
public:
  explicit TimerCount(QObject *parent = nullptr);

signals:
  void timeValue(QVariant time);
  void countValue(QVariant count);
  void finished();

public slots:
  ///
  /// \brief setWork
  /// \param time
  ///
  void setWork(QVariant time) {
    bool ok = false;
    int t = time.toInt(&ok);
    if (ok) {
      _workTime = t;
      _time = _workTime;
    }
  }

  ///
  /// \brief setRecup
  /// \param time
  ///
  void setRecup(QVariant time) {
    bool ok = false;
    int t = time.toInt(&ok);
    if (ok) {
      _RecupTime = t;
    }
  }

  ///
  /// \brief setCount
  /// \param count
  ///
  void setCount(QVariant count) {
    bool ok = false;
    int t = count.toInt(&ok);
    if (ok) {
      _count = t;
    }
  }

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
  int _time;
  int _workTime, _RecupTime;
  int _count;
};

#endif // TimerCount_H
