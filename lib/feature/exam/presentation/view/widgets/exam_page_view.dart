import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../answer/view/widgets/q_and_answer_widget.dart';
import '../../../domain/entities/question_entity.dart';
import '../../view_model/exam_cubit.dart';

class ExamPageView extends StatelessWidget {
  const ExamPageView({super.key, required this.questions});

  final List<QuestionEntity> questions;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamCubit>();

    return Expanded(
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: cubit.pageController,
        onPageChanged: cubit.onPageChanged,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return QAndAnswerWidget(questionEntity: questions[index]);
        },
      ),
    );
  }
}
