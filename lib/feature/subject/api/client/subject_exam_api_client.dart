import 'package:dio/dio.dart';
import 'package:exam_app/feature/subject/data/models/subject_exam_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';

part 'subject_exam_api_client.g.dart';


@injectable
@RestApi()
abstract class SubjectExamApiClient {
  @factoryMethod
  factory SubjectExamApiClient(Dio dio,) = _SubjectExamApiClient;

  @GET(ApiConstant.getExamBySubjectsIdEndPoint)
  Future<SubjectExamResponse> getSubjectExam(@Query("subject")String subjectId);
}
