import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'answer_container_item.dart';
import 'header_of_question.dart';

class AnswerViewBody extends StatelessWidget {
  final List<QuestionEntity> questions;
  final Map<String, String> selectedAnswers;

  const AnswerViewBody({
    super.key,
    required this.questions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CustomAppBar(title: "Answers Review"),
          SizedBox(height: 32.h),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final userAnswerKey = selectedAnswers[question.id];

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderOfQuestion(header: question.question ?? ""),
                        const SizedBox(height: 8),
                        // عرض الإجابات
                        ...question.answers!.map((answer) {
                          final bool isCorrect = answer.key == question.correct;
                          final bool wasSelected = answer.key == userAnswerKey;

                          return AnswersContainerItem(
                            text: "${answer.key}: ${answer.answer}",
                            // --- تمرير الخصائص الجديدة هنا ---
                            isCorrectAnswer: isCorrect,
                            wasSelectedByUser: wasSelected,
                            // isSelected هنخليها false عشان دي في وضع المراجعة
                            isSelected: false,
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}