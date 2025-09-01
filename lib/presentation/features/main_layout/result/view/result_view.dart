import 'package:exam_app/presentation/features/main_layout/result/view/widgets/result_exam_info_section_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Result",
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(height: 40.h,),

        const Expanded(child:ResultExamInfoSectionListView()),


      ],
    );
  }
}
