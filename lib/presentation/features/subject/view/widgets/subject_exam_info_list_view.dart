import 'package:exam_app/presentation/features/subject/view/widgets/subject_exam_info_card_item.dart';
import 'package:flutter/material.dart';

class SubjectExamInfoListView extends StatelessWidget {
  const SubjectExamInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: SubjectExamInfoCardItem(),
        );
      },
    );
  }
}
