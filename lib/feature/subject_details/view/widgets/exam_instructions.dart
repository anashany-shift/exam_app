import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class ExamInstructions extends StatelessWidget {
  const ExamInstructions({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Instructions", style: theme.textTheme.titleMedium),
        SizedBox(height: 16.h),
         Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:Column(
                    children: [
                      Text(
                        "• Please read all questions carefully before answering.",
                        style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                      ),

                      Text(
                        "• You must complete the exam within the given time limit.",
                        style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                      ),

                      Text(
                        "• Do not use any external materials or devices during the exam.",
                        style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                      ),

                      Text(
                        "• Make sure to review your answers before final submission.",
                        style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.grey),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),


      ],
    );
  }
}
