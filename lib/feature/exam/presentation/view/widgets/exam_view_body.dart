import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_progress_indicator.dart';
import 'package:exam_app/feature/exam/presentation/view_model/exam_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/button_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../answer/view/widgets/q_and_answer_widget.dart';
import 'custom_alert_dialog.dart';
import 'exam_view_header.dart';
import 'progress_indicator_widget.dart';

class ExamViewBody extends StatelessWidget {
  const ExamViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamCubit>();

    return BlocConsumer<ExamCubit, ExamState>(
      listener: (context, state) {
        if (state is QuestionSuccess && state.examFinished) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const CustomAlertDialog(),
            );
          });
        }
      },
      builder: (context, state) {
        switch (state) {
          case ExamInitial():
            return const SizedBox.shrink();
          case QuestionLoading():
            return const CustomProgressIndicator();
          case QuestionError():
            return Center(child: Text(state.errorMessage));
          case QuestionSuccess():
            final questions = state.questions;
            final totalQuestions = questions.length;
            final duration = state.examInfoEntity.duration ?? 0;
            final currentPage = state.currentPage;
            double progress = (currentPage + 1) / totalQuestions;

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  ExamViewHeader(
                    onTimeFinish: cubit.finishExam,
                    duration: duration,
                  ),
                  SizedBox(height: 20.h),
                  ProgressIndicatorWidget(
                    current: currentPage + 1,
                    progress: progress,
                    total: totalQuestions,
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: cubit.pageController,
                      onPageChanged: cubit.onPageChanged,
                      itemCount: totalQuestions,
                      itemBuilder: (context, index) {
                        return QAndAnswerWidget(
                          questionEntity: questions[index],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 80.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          buttonModel: ButtonModel(
                            borderRadius: 10,
                            backgroundColor: Colors.white,
                            textColor: AppColors.blue,
                            text: "Back",
                            onPressed: cubit.previousPage,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomButton(
                          buttonModel: ButtonModel(
                            borderRadius: 10,
                            text: "Next",
                            onPressed: cubit.nextPage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
