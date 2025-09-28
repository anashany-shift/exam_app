part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

class TimerInitial extends TimerState {}

class TimerRunning extends TimerState {
  final int remainingSeconds;
  TimerRunning(this.remainingSeconds);
}

class TimerFinished extends TimerState {}