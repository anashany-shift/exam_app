import 'package:exam_app/presentation/features/exam/exam_soccer/view/widgets/exam_score_view_body.dart';
import 'package:flutter/material.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ExamScoreViewBody()),
    );
  }
}
