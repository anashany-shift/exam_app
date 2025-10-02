import 'package:exam_app/core/widget/custom_progress_indicator.dart';
import 'package:exam_app/feature/exam/presentation/view_model/reult_cubit/result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chart_widget.dart';
import 'correct_item_section.dart';

class ScoreSection extends StatelessWidget {
  const ScoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your score", style: theme.textTheme.titleMedium),
        SizedBox(height: 24.h),

        BlocBuilder<ResultCubit, ResultState>(
          builder: (context, state) {
            switch(state){

              case ResultInitial():
              case CheckQuestionLoading():
              return const CustomProgressIndicator();
              case CheckQuestionSuccess():
                final checkQuestionState=state.checkQuestionEntity;
                return Row(
                  children: [
                    ChartWidget(percentage:checkQuestionState),
                    SizedBox(width: 24.w),
                     CorrectItemSection(checkQuestionEntity: checkQuestionState,),
                  ],
                );
              case CheckQuestionError():
              return Text(state.errorMessage);
            }

          },
        ),
      ],
    );
  }
}
