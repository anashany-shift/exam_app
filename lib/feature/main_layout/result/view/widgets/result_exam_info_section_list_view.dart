import 'package:exam_app/feature/main_layout/result/view/widgets/result_exam_info_section.dart';
import 'package:flutter/material.dart';

class ResultExamInfoSectionListView extends StatelessWidget {
  const ResultExamInfoSectionListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return const ResultExamInfoSection();
      },);
  }
}

