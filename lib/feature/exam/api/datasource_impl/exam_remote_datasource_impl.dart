import 'package:exam_app/feature/exam/api/client/exam_api_client.dart';
import 'package:exam_app/feature/exam/data/models/question_response.dart';
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




}