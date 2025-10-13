import 'package:flutter/material.dart';
import '../../../../exam/data/models/completed_exam.dart';
import 'result_exam_info_card_item.dart';

class ResultExamInfoListView extends StatelessWidget {
  final List<CompletedExam> completedExams;
  const ResultExamInfoListView({super.key, required this.completedExams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completedExams.length,
      itemBuilder: (context, index) {
        final completedExam = completedExams[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ResultExamInfoCardItem(completedExam: completedExam,),
        );
      },
    );
  }
}