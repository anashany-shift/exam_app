import 'package:flutter/material.dart';

import 'answer_container_item.dart';

class AnswerContainerItemListView extends StatefulWidget {
  const AnswerContainerItemListView({super.key});

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
      itemCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              setState(() {

                selectedIndex=index;
              });
            },

            child: AnswersContainerItem(isSelected:selectedIndex==index));
      },
    );
  }
}