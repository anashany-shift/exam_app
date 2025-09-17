import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/feature/subject/domain/entities/subject_exam_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';

class SubjectExamInfoCardItem extends StatelessWidget {
  const SubjectExamInfoCardItem({
    super.key, required this.subjectExam,
  });
  final SubjectExamEntity subjectExam;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(

      child: InkWell(
        onTap: () async{
          if (!context.mounted) return;
          await Navigator.pushNamed(context, Routes.subjectDetails);

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24,
          ),
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
                      subjectExam.title??"",
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "${subjectExam.numberOfQuestions} Question",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "18 corrected answers in 25 min. ",
                      style: theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.primary)
                    ),
                  ],
                ),
              ),
              Text(
                "${subjectExam.duration} minutes",
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}