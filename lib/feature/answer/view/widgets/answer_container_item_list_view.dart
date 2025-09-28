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
  });

  final List<AnswerEntity> answersEntity;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        if (state is! QuestionSuccess) {
          return const SizedBox();
        }

        final selectedKey = state.selectedAnswers[questionId];

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: answersEntity.length,
          itemBuilder: (context, index) {
            final answer = answersEntity[index];
            return GestureDetector(
              onTap: () {
                context.read<ExamCubit>().selectedAnswer(
                  questionId: questionId,
                  answerKey: answer.key ?? "",
                );
              },
              child: AnswersContainerItem(
                isSelected: selectedKey == answer.key,
                text: answer.answer ?? ''
              ),
            );
          },
        );
      },
    );
  }
}
