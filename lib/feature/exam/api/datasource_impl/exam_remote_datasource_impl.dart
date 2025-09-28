import 'package:exam_app/feature/exam/api/client/exam_api_client.dart';
import 'package:exam_app/feature/exam/data/models/check_question_response.dart';
import 'package:exam_app/feature/exam/data/models/question_response.dart';
import 'package:exam_app/feature/exam/data/models/requests/check_question_request.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasource/exam_remote_datasource.dart';
@Injectable(as:ExamRemoteDataSource )
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource{
  final ExamApiClient examApiClient;

  ExamRemoteDataSourceImpl(this.examApiClient);

  @override
  Future<QuestionResponse> getQuestions({required String examId})async {
    return await examApiClient.getQuestion(examId);
  }

  @override
  Future<CheckQuestionResponse> checkQuestions({required CheckQuestionRequest checkQuestionRequest})async {
   return await examApiClient.checkQuestion(checkQuestionRequest);
  }





}