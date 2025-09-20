import 'package:exam_app/core/utils/app_assets.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'timer_count_widget.dart';

class ExamViewHeader extends StatelessWidget {
  const ExamViewHeader({super.key, required this.onTimeFinish});
  final VoidCallback onTimeFinish;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomAppBar(title: "Exam"),

            Row(
              children: [
                Image.asset(AppAssets.clock),
                SizedBox(width: 3.w),
                 TimerCountWidget(duration: 10,onTimeFinish:onTimeFinish,),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
