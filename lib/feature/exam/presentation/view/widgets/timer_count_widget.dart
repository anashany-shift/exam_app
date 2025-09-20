import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class TimerCountWidget extends StatefulWidget {
  const TimerCountWidget({
    super.key,
    required this.duration,
    required this.onTimeFinish,
  });
  final int duration;
  final VoidCallback onTimeFinish;

  @override
  State<TimerCountWidget> createState() => _TimerCountWidgetState();
}

class _TimerCountWidgetState extends State<TimerCountWidget> {
  late CountdownTimerController _controller;

  Color textColor = Colors.green;
  bool _isFinishedCalled = false;

  @override
  void initState() {
    super.initState();
    final endTime =
        DateTime.now().millisecondsSinceEpoch + widget.duration * 1000;
    _controller = CountdownTimerController(
      endTime: endTime,
      onEnd: _handleTimeFinish,
    );
  }

  void _handleTimeFinish() {
    if (!_isFinishedCalled) {
      _isFinishedCalled = true;
      widget.onTimeFinish();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      controller: _controller,
      widgetBuilder: (_, CurrentRemainingTime? time) {
        if (time == null) {
          return Text(
            "00:00",
            style: TextStyle(fontSize: 20, color: textColor),
          );
        }

        int remainingSeconds = (time.min ?? 0) * 60 + (time.sec ?? 0);

        if (remainingSeconds <= widget.duration ~/ 2) {
          textColor = Colors.red;
        }

        String minutes = (time.min ?? 0).toString().padLeft(2, "0");
        String seconds = (time.sec ?? 0).toString().padLeft(2, "0");

        return Text(
          "$minutes:$seconds",
          style: TextStyle(fontSize: 20, color: textColor),
        );
      },
    );
  }
}
