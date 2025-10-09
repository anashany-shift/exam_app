import 'package:exam_app/feature/exam/exam_soccer/view/widgets/exam_score_view_body.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/question_entity.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.examId,
  });
  final List<QuestionEntity> questions;
  final Map<String, String> selectedAnswers;
  final String examId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ExamScoreViewBody(
          questions: questions,
          selectedAnswers: selectedAnswers,
          examId: examId,
        ),
      ),
    );
  }
}
