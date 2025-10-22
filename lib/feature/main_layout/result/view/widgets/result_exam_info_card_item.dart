import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/utils/app_assets.dart';
import 'package:exam_app/core/utils/app_colors.dart';
import 'package:exam_app/feature/exam/data/mapper/completed_exam_mapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../exam/data/models/completed_exam.dart';

class ResultExamInfoCardItem extends StatelessWidget {
  final CompletedExam completedExam;
  const ResultExamInfoCardItem({super.key, required this.completedExam});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    final questions = completedExam.questions.map((q) => q.toEntity()).toList();
    final userAnswers = completedExam.userAnswers;

    return Card(
      child: InkWell(
        onTap: () {
          final arguments = {
            'questions': questions,
            'selectedAnswers': userAnswers,
          };
          Navigator.pushNamed(context, Routes.answer, arguments: arguments);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppAssets.profit),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      completedExam.examName,
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "${completedExam.questions.length} Question",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "${completedExam.result.correct} corrected answers ", 
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: theme.colorScheme.primary),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}