import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';

import 'answer_container_item_list_view.dart';
import 'header_of_question.dart';

class QAndAnswerWidget extends StatelessWidget {

  const QAndAnswerWidget({
    super.key, required this.questionEntity,
  });


  final QuestionEntity questionEntity;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        HeaderOfQuestion(header: questionEntity.question??"", ),
        AnswerContainerItemListView(answersEntity: questionEntity.answers??[],questionId: questionEntity.id??"",),
]);
  }
}
