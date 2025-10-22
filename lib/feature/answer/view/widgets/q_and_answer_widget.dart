import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../exam/presentation/view_model/exam_cubit.dart';
import 'answer_container_item_list_view.dart';
import 'header_of_question.dart';

class QAndAnswerWidget extends StatelessWidget {
  const QAndAnswerWidget({
    super.key,
    required this.questionEntity,
  });

  final QuestionEntity questionEntity;

  @override
  Widget build(BuildContext context) {
    // 1. قمنا بنقل BlocBuilder إلى هنا
    return BlocBuilder<ExamCubit, ExamState>(
      builder: (context, state) {
        // Safety check to ensure we have the correct state
        if (state is! QuestionSuccess) {
          return const SizedBox.shrink();
        }

        final selectedKey = state.selectedAnswers[questionEntity.id];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderOfQuestion(header: questionEntity.question ?? ""),
            AnswerContainerItemListView(
              answersEntity: questionEntity.answers ?? [],
              questionId: questionEntity.id ?? "",
              selectedAnswerKey: selectedKey,
              onAnswerTapped: (answerKey) {
                context.read<ExamCubit>().selectedAnswer(
                  questionId: questionEntity.id ?? "",
                  answerKey: answerKey,
                );
              },
            ),
          ],
        );
      },
    );
  }
}