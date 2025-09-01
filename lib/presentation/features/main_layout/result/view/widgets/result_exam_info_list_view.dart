import 'package:flutter/material.dart';

import 'result_exam_info_card_item.dart';

class ResultExamInfoListView extends StatelessWidget {
  const ResultExamInfoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: ResultExamInfoCardItem(),
        );
      },
    );
  }
}
