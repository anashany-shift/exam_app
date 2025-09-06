import 'package:flutter/material.dart';

import 'answer_container_item_list_view.dart';
import 'header_of_question.dart';

class QAndAnswerWidget extends StatelessWidget {
  const QAndAnswerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderOfQuestion(),
        AnswerContainerItemListView(),
    
    
      ],
    );
  }
}
