import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/presentation/features/answer/view/widgets/q_and_answer_widget.dart';
import 'package:exam_app/presentation/features/exam/view/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/button_model.dart';
import '../../../../../core/utils/app_colors.dart';
import 'exam_view_header.dart';
import 'progress_indicator_widget.dart';

class ExamViewBody extends StatefulWidget {
  const ExamViewBody({super.key});

  @override
  State<ExamViewBody> createState() => _ExamViewBodyState();
}

class _ExamViewBodyState extends State<ExamViewBody> {
  late PageController _pageController;
  int currentPage = 0;
  final int totalQuestions = 5;
  bool _isDialogShown = false;

  @override
  PageController initState() {
    super.initState();
    return _pageController = PageController();
  }
  @override
  Widget build(BuildContext context) {
    double progress = (currentPage + 1) / totalQuestions;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
      child: Column(
        children: [
           ExamViewHeader(onTimeFinish:showExamFinishDialog ,),
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
              controller: _pageController,
              itemCount: totalQuestions,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },

              itemBuilder: (context, index) {
                return const QAndAnswerWidget();
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
                    onPressed: previousPageFun,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomButton(
                  buttonModel: ButtonModel(
                    borderRadius: 10,
                    text: "Next",
                    onPressed: nextPageFun,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  void nextPageFun() {
    if (currentPage < totalQuestions - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (currentPage == totalQuestions - 1) {
      showExamFinishDialog();
    }
  }

  previousPageFun() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  void showExamFinishDialog() {
    if (!_isDialogShown) {
      _isDialogShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false, // ممنوع يتقفل بالضغط برا
          builder: (_) => const CustomAlertDialog(),
        );
      });
    }
  }
}
