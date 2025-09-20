import 'package:exam_app/feature/subject/data/models/subject_exam_response.dart';

abstract class SubjectExamRemoteDataSource{
Future<SubjectExamResponse>getSubjectExam({required String subjectId});
}