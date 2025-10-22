import 'package:exam_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswersContainerItem extends StatelessWidget {
  const AnswersContainerItem({
    super.key,
    required this.text,
    this.isSelected = false,
    this.isCorrectAnswer,
    this.wasSelectedByUser,
  });

  final String text;
  final bool isSelected;
  final bool? isCorrectAnswer;
  final bool? wasSelectedByUser;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    Color backgroundColor = AppColors.lightBlue;
    Color borderColor = Colors.transparent;

    if (isCorrectAnswer != null) {
      if (isCorrectAnswer!) {
        backgroundColor = AppColors.lightGreen;
        borderColor = AppColors.green;
      } else if (wasSelectedByUser == true) {
        backgroundColor = AppColors.lightRed;
        borderColor = AppColors.red;
      }
    } else {
      backgroundColor = isSelected ? AppColors.blue[10]! : AppColors.lightBlue;
    }

    Color checkboxActiveColor = AppColors.blue;

    if (wasSelectedByUser == true) {
      if (isCorrectAnswer == true) {
        checkboxActiveColor = AppColors.green;
      }
      else {
        checkboxActiveColor = AppColors.red;
      }
    }


    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          border: Border.all(
            width: 1.5,
            color: borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Checkbox(
                value: wasSelectedByUser ?? isSelected,
                activeColor: checkboxActiveColor,
                onChanged: (value) {},
              ),
              SizedBox(width: 8.w),
              Expanded(child: Text(text, style: theme.textTheme.bodyMedium)),
            ],
          ),
        ),
      ),
    );
  }
}