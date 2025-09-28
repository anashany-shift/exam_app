import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/timer_cubit/timer_cubit.dart';

class TimerCountWidget extends StatelessWidget {
  const TimerCountWidget({
    super.key,
    required this.duration,
    required this.onTimeFinish,
  });

  final int duration;
  final VoidCallback onTimeFinish;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listenWhen: (_, state) => state is TimerFinished,
      listener: (_, __) => onTimeFinish(),
      builder: (context, state) {
        if (state is TimerRunning) {
          final minutes = (state.remainingSeconds ~/ 60).toString().padLeft(2, "0");
          final seconds = (state.remainingSeconds % 60).toString().padLeft(2, "0");

          final isHalfTime = state.remainingSeconds <= (duration * 60) ~/ 2;
          final color = isHalfTime ? Colors.red : Colors.green;

          return Text(
            "$minutes:$seconds",
            style: TextStyle(fontSize: 20, color: color),
          );
        } else if (state is TimerFinished) {
          return const Text(
            "00:00",
            style: TextStyle(fontSize: 20, color: Colors.red),
          );
        }

        return const SizedBox.shrink(); // في حالة Initial
      },
    );
  }
}
