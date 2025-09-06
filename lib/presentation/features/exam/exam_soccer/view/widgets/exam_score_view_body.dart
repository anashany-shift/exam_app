import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/utils/app_colors.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/presentation/features/exam/exam_soccer/view/widgets/score_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamScoreViewBody extends StatelessWidget {
  const ExamScoreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: "Exam Score"),
          SizedBox(height: 40.h),
          const ScoreSection(),
          SizedBox(height: 80.h),
          CustomButton(
            buttonModel: ButtonModel(
              text: "show result",
              onPressed: () {
                Navigator.pushNamed(context, Routes.answer);
              },
            ),
          ),
          SizedBox(height: 24.h),
          CustomButton(
            buttonModel: ButtonModel(
              backgroundColor: AppColors.white,
              textColor: AppColors.blue,
              text: "start again",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
