import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widget/custom_app_bar.dart';

class SubjectDetailsExamInfo extends StatelessWidget {
  const SubjectDetailsExamInfo({
    super.key, required this.title, required this.numberofQ, required this.duration,
  });
final String title;
final int numberofQ;
final int duration;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      children: [
        const CustomAppBar(),
        const SizedBox(height: 24),

        Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(AppAssets.profit),
                title: Text(
                  "Exam",
                  style: theme.textTheme.titleLarge,
                ),
                trailing: Text(
                  "$duration minutes",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            SizedBox(
              height: 20,
              child: VerticalDivider(
                color: AppColors.blue[30],
                thickness: 2.1,
                width: 21, // المسافة الأفقية حواليه
              ),
            ),
            Text(
              "$numberofQ Question",
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
