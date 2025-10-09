import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../exam/domain/entities/answer_entity.dart';
import '../../../exam/presentation/view_model/exam_cubit.dart';
import 'answer_container_item.dart';

class AnswerContainerItemListView extends StatelessWidget {
  const AnswerContainerItemListView({
    super.key,
    required this.answersEntity,
    required this.questionId,
    required this.selectedAnswerKey,
    this.onAnswerTapped,
  });

  final List<AnswerEntity> answersEntity;
  final String questionId;
  final String? selectedAnswerKey;
  final Function(String)? onAnswerTapped;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: answersEntity.length,
      itemBuilder: (context, index) {
        final answer = answersEntity[index];
        return GestureDetector(
          onTap: onAnswerTapped != null
              ? () => onAnswerTapped!(answer.key ?? "")
              : null,
          child: AnswersContainerItem(
            isSelected: selectedAnswerKey == answer.key,
            text: answer.answer ?? '',
          ),
        );
      },
    );
  }
}