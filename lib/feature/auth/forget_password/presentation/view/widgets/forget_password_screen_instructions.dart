import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';

class ForgetPasswordScreenInstructions extends StatelessWidget {
  const ForgetPasswordScreenInstructions({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Text(title, style: theme.textTheme.titleMedium),
        SizedBox(height: 16.h),
        Text(
          subTitle,
          style: theme.textTheme.bodyMedium!.copyWith(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
