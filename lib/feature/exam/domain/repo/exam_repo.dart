import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';

abstract class ExamRepo{
  Future<ApiResult<List<QuestionEntity>>>getQuestion({required String examId});

}