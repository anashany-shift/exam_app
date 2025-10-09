import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/widget/custom_progress_indicator.dart';
import 'package:exam_app/feature/exam/presentation/view_model/exam_cubit.dart';
import 'package:exam_app/feature/exam/presentation/view_model/timer_cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_alert_dialog.dart';
import 'exam_sucess_view.dart';

class ExamViewBody extends StatelessWidget {
  const ExamViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamCubit, ExamState>(
      listenWhen: (previous, current) =>
          previous is! QuestionSuccess && current is QuestionSuccess,
      listener: (context, state) {
        if (state is QuestionSuccess) {
          context.read<TimerCubit>().start(state.examInfoEntity.duration ?? 0);
        }
      },
      child: BlocConsumer<ExamCubit, ExamState>(
        listener: (context, state) {
          if (state is QuestionSuccess && state.examFinished) {
              context.read<TimerCubit>().stop();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => CustomAlertDialog(onPressed: (){
                  final examCubit = context.read<ExamCubit>();
                  final timerCubit = context.read<TimerCubit>();
                  if (examCubit.state is QuestionSuccess) {
                    final currentState = examCubit.state as QuestionSuccess;
                    final request = examCubit.buildCheckQuestionRequest(timerCubit.timeTaken);
                    final questions = currentState.questions;
                    final selectedAnswers = currentState.selectedAnswers;
                    final examId = currentState.examInfoEntity.examId;

                    final arguments = {
                      'request': request,
                      'questions': questions,
                      'selectedAnswers': selectedAnswers,
                      'examId': examId,
                    };

                    // 3. انتقل إلى شاشة النتيجة مع كل البيانات
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.examScore,
                      arguments: arguments,
                    );
                  }

                },),
              );
            });
          }
        },
        builder: (context, state) {
          switch (state) {
            case ExamInitial():
            case QuestionLoading():
              return const CustomProgressIndicator();
            case QuestionError():
              return Center(child: Text(state.errorMessage));
            case QuestionSuccess():
              return ExamSuccessView(state: state);
          }
        },
      ),
    );
  }
}
