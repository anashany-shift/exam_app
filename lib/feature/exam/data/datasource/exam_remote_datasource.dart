import 'package:exam_app/feature/exam/data/models/question_response.dart';

abstract class ExamRemoteDataSource{

  Future<QuestionResponse>getQuestions({required String examId});
}