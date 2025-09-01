import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widget/custom_app_bar.dart';

class SubjectDetailsExamInfo extends StatelessWidget {
  const SubjectDetailsExamInfo({
    super.key,
  });


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
                  "Language",
                  style: theme.textTheme.titleLarge,
                ),
                trailing: Text(
                  "30 minutes",
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
            Text("High level", style: theme.textTheme.titleMedium),
            SizedBox(
              height: 20,
              child: VerticalDivider(
                color: AppColors.blue[30],
                thickness: 2.1,
                width: 21, // المسافة الأفقية حواليه
              ),
            ),
            Text(
              "20 Question",
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
