import 'package:exam_app/feature/main_layout/result/view/widgets/result_exam_info_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/di.dart';
import '../../../exam/presentation/view_model/result_history_cubit/result_history_cubit.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Result",
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(height: 40.h),
        Expanded(
          child: BlocBuilder<ResultHistoryCubit, ResultHistoryState>(
            builder: (context, state) {
              if (state is ResultHistorySuccess) {
                if (state.completedExam.isEmpty) {
                  return const Center(child: Text("You haven't completed any exams yet."));
                }
                return ResultExamInfoListView(completedExams: state.completedExam);
              }
              if (state is ResultHistoryLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ResultHistoryError) {
                return Center(child: Text(state.errorMessage));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}