import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/models/button_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../view_model/exam_cubit.dart';

class ExamNavigationButtons extends StatelessWidget {
  const ExamNavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamCubit>();

    return Row(
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
    );
  }
}
