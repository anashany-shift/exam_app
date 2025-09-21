import 'package:exam_app/feature/exam/domain/entities/exam_info_entity.dart';

import 'answer_entity.dart';

class QuestionEntity {
  final List<AnswerEntity>? answers;
  final String? type;
  final String? correct;
  final String? question;
  final String? id;
  final ExamInfoEntity? examInfoEntity;

  QuestionEntity( {
   required this.examInfoEntity,
    required this.answers,
    required this.type,
    required this.correct,
    required this.question,
    required this.id,
  });
}
