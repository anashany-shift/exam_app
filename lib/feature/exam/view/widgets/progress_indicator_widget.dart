import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    required this.progress,
    required this.current,
    required this.total,
  });
  final double progress;
  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Center(
          child: Text(
            "Question $current of $total",
            style: theme.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 4),

        /// progress bar
        LinearProgressIndicator(
          value: progress,
          minHeight: 4,
          backgroundColor: Colors.grey[300],
          color: theme.colorScheme.primary,
        ),
      ],
    );
  }
}
