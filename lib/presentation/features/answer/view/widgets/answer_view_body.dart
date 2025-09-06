import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'answer_card.dart';

class AnswerViewBody extends StatelessWidget {
  const AnswerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(16.0),
      child: Column(
        children: [
           const CustomAppBar(title: "Answers"),
          SizedBox(height: 32.h),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
              return const AnswerCard();
            },),
          )
           
        ],
      ),
    );
  }
}
