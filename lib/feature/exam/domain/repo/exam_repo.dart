import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';

import '../../data/models/completed_exam.dart';
import '../../data/models/requests/check_question_request.dart';
import '../entities/check_question_entity.dart';

abstract class ExamRepo {
  Future<ApiResult<List<QuestionEntity>>> getQuestion({required String examId});
  Future<ApiResult<CheckQuestionEntity>> checkQuestion({
    required CheckQuestionRequest checkQuestionRequest,
    required List<QuestionEntity> questions,
  });
  Future<List<CompletedExam>> getCompletedExams();
}
