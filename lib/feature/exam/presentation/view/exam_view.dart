import 'package:exam_app/feature/exam/presentation/view/widgets/exam_view_body.dart';
import 'package:flutter/material.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body:  SafeArea(child: ExamViewBody())
     
    );
  }
}