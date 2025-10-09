import 'package:exam_app/feature/answer/view/widgets/answer_view_body.dart';
import 'package:flutter/material.dart';

import '../../exam/domain/entities/question_entity.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({super.key, required this.questions, required this.selectedAnswers});
  final List<QuestionEntity> questions;
  final Map<String, String> selectedAnswers;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: AnswerViewBody(questions:questions, selectedAnswers: selectedAnswers,)),
    );
  }
}
