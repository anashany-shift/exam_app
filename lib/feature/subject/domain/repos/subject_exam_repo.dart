import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/subject/domain/entities/subject_exam_entity.dart';

abstract class SubjectExamRepo{

  Future<ApiResult<List<SubjectExamEntity>>>getSubjectExam({required String subjectId});

}