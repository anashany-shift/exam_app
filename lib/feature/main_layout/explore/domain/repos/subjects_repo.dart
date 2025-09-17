import 'package:exam_app/core/config/api_result.dart';

import '../entities/subjects_entity.dart';

abstract class SubjectsRepo{
  Future<ApiResult<List<SubjectEntity>>>getSubjects();

}