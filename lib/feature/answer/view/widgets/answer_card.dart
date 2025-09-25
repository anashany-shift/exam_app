import 'package:flutter/material.dart';



class AnswerCard extends StatefulWidget {
  const AnswerCard({super.key});

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 24.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
          child: SizedBox()//QAndAnswerWidget(questionEntity: ,),
        ),
      ),
    );
  }
}


