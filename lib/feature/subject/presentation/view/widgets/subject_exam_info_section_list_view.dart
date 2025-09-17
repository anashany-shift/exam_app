import 'package:exam_app/feature/subject/presentation/view/widgets/subject_exam_info_section.dart';
import 'package:flutter/material.dart';

class SubjectExamInfoSectionListView extends StatelessWidget {
  const SubjectExamInfoSectionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return const SubjectExamInfoSection();
      },);
  }
}

