import 'package:exam_app/feature/exam/data/models/check_question_response.dart';
import 'package:exam_app/feature/exam/data/models/question_response.dart';

import '../models/requests/check_question_request.dart';

abstract class ExamRemoteDataSource{

  Future<QuestionResponse>getQuestions({required String examId});
  Future<CheckQuestionResponse>checkQuestions({required CheckQuestionRequest checkQuestionRequest});
}