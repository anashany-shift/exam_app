
import '../../model/subject_response.dart';

abstract class SubjectsRemoteDataSource{
  Future<SubjectResponse>getSubjects();
}