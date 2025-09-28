import 'package:exam_app/feature/exam/presentation/view/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../view_model/exam_cubit.dart';
import 'exam_navigation_buttons.dart';
import 'exam_page_view.dart';
import 'exam_view_header.dart';

class ExamSuccessView extends StatelessWidget {
  const ExamSuccessView({super.key, required this.state});
  final QuestionSuccess state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamCubit>();
    final questions = state.questions;
    final totalQuestions = questions.length;
    final duration = state.examInfoEntity.duration ?? 0;
    final currentPage = state.currentPage;
    double progress = (currentPage + 1) / totalQuestions;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
      child: Column(
        children: [
          ExamViewHeader(onTimeFinish: cubit.finishExam, duration: duration),
          SizedBox(height: 20.h),
          ProgressIndicatorWidget(
            current: currentPage + 1,
            progress: progress,
            total: totalQuestions,
          ),
          SizedBox(height: 30.h),

          ExamPageView(
            questions: questions,
          ),

          SizedBox(height: 80.h),
          const ExamNavigationButtons(),
        ],
      ),
    );
  }
}

