import 'package:dio/dio.dart';
import 'package:exam_app/feature/exam/data/models/question_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';

part 'exam_api_client.g.dart';


@injectable
@RestApi()
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio,) = _ExamApiClient;

  @GET(ApiConstant.getQuestionByExamIdEndPoint)
  Future<QuestionResponse> getQuestion(@Query("exam")String examId);
}
