import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'timer_state.dart';

@injectable
class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;
  int _remainingSeconds = 0;
  int _initialSeconds = 0;

  TimerCubit() : super(TimerInitial());

  void start(int durationInMinutes) {
    if (state is TimerRunning) return;

    _timer?.cancel();
    _initialSeconds = durationInMinutes * 60;
    _remainingSeconds = _initialSeconds;
    if (_remainingSeconds <= 0) {
      emit(TimerFinished());
      return;
    }


    emit(TimerRunning(_remainingSeconds));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        emit(TimerRunning(_remainingSeconds));
      } else {
        timer.cancel();
        emit(TimerFinished());
      }
    });
  }

  int get timeTaken => _initialSeconds - _remainingSeconds;

  int get remainingSeconds => _remainingSeconds;

  void stop() {
    _timer?.cancel();
    emit(TimerFinished());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
