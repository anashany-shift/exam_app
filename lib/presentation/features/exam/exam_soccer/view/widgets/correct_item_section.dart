import 'package:exam_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'correct_item.dart';

class CorrectItemSection extends StatelessWidget {
  const CorrectItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CorrectItem(title: "correct",color: AppColors.blue,count: 18,),
            SizedBox(height: 8,),
            CorrectItem(title: "Incorrect",color: AppColors.red,count: 2,)

          ],
        ),
      ],
    );
  }
}
