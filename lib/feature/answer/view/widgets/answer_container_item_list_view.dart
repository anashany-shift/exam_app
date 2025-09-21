import 'package:flutter/material.dart';

import '../../../exam/domain/entities/answer_entity.dart';
import 'answer_container_item.dart';

class AnswerContainerItemListView extends StatefulWidget {
  const AnswerContainerItemListView({super.key, required this.answers});
  final List<AnswerEntity> answers;
  @override
  State<AnswerContainerItemListView> createState() => _AnswerContainerItemListViewState();
}

class _AnswerContainerItemListViewState extends State<AnswerContainerItemListView> {
  int selectedIndex=-1;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:widget.answers.length ,
      itemBuilder: (context, index) {
        final answer = widget.answers[index];
        return GestureDetector(
            onTap: (){
              setState(() {

                selectedIndex=index;
              });
            },

            child: AnswersContainerItem(isSelected:selectedIndex==index,text: answer.answer??'',));
      },
    );
  }
}