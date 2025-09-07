import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/feature/subject/view/widgets/subject_exam_info_section_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectViewBody extends StatelessWidget {
  const SubjectViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomAppBar(title: "Language"),

            SizedBox(height: 40.h),
            const Expanded(child: SubjectExamInfoSectionListView()),
          ],
        ),
      ),
    );
  }
}
