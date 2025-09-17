import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';
import '../../data/model/subject_response.dart';

part 'subjects_api_client.g.dart';


@injectable
@RestApi()
abstract class SubjectsApiClient {
  @factoryMethod
  factory SubjectsApiClient(Dio dio,) = _SubjectsApiClient;

  @GET(ApiConstant.getAllSubjectsEndPoint)
  Future<SubjectResponse> getSubjects();
}
