import 'package:exam_app/core/utils/app_colors.dart';
import 'package:exam_app/feature/exam/domain/entities/check_question_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'correct_item.dart';

class CorrectItemSection extends StatelessWidget {
  const CorrectItemSection({
    super.key, required this.checkQuestionEntity,
  });
  final CheckQuestionEntity checkQuestionEntity;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CorrectItem(title: "correct",color: AppColors.blue,count:checkQuestionEntity.correct??0,),
            SizedBox(height: 8.h,),
            CorrectItem(title: "Incorrect",color: AppColors.red,count: checkQuestionEntity.wrong??0,)

          ],
        ),
      ],
    );
  }
}
