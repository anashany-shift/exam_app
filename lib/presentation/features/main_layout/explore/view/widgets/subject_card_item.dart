import 'package:exam_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_assets.dart';

class SubjectCardItem extends StatelessWidget {
  const SubjectCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.subject);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 2.0, bottom: 16),
        child: Card(

          child:Padding(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
            child: Row(
              children: [
                Image.asset(AppAssets.colorPalete),
                SizedBox(width: 8.w,),
                Text("Language", style: theme.textTheme.titleSmall),



              ],
            ),
          )
        ),
      ),
    );
  }
}
