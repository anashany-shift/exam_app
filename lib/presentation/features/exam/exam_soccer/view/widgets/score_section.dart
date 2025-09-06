import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chart_widget.dart';
import 'correct_item_section.dart';

class ScoreSection extends StatelessWidget {
  const ScoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    int correct = 18;
    int incorrect = 2;
    int total = correct + incorrect;
    double percentage = (correct / total) * 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your score", style: theme.textTheme.titleMedium),
        SizedBox(height: 24.h),

        Row(
          children: [
            ChartWidget(percentage: percentage ),
            SizedBox(width: 24.w),
            const CorrectItemSection(),
          ],
        ),
      ],
    );
  }
}
