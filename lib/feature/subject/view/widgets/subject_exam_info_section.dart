import 'package:exam_app/feature/subject/view/widgets/subject_exam_info_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectExamInfoSection extends StatelessWidget {
  const SubjectExamInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("English", style: theme.textTheme.titleSmall),
        SizedBox(height: 24.h),
        const SubjectExamInfoListView()
      ],
    );
  }
}

