import 'package:exam_app/presentation/features/answer/view/widgets/answer_view_body.dart';
import 'package:flutter/material.dart';

class AnswerView extends StatelessWidget {
  const AnswerView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(child: AnswerViewBody()),
    );
  }
}
