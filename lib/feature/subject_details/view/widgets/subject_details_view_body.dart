import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/utils/app_colors.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/feature/subject_details/view/widgets/subject_details_exam_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'exam_instructions.dart';

class SubjectDetailsViewBody extends StatelessWidget {
  const SubjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.sp),
          child: const SubjectDetailsExamInfo(),
        ),
        Divider(height: 5, thickness: 1, color: AppColors.blue[20]),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const ExamInstructions(),
                SizedBox(height: 48.h),
                CustomButton(
                  buttonModel: ButtonModel(
                    text: "Start",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.exam);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
