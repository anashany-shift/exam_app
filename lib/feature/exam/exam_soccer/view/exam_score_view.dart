import 'package:exam_app/feature/exam/exam_soccer/view/widgets/exam_score_view_body.dart';
import 'package:flutter/material.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ExamScoreViewBody()),
    );
  }
}
