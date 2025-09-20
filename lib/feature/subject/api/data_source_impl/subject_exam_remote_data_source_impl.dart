import 'package:exam_app/feature/subject/api/client/subject_exam_api_client.dart';
import 'package:exam_app/feature/subject/data/datasources/subject_exam_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/subject_exam_response.dart';

@Injectable(as:SubjectExamRemoteDataSource )
class SubjectExamRemoteDataSourceImpl implements SubjectExamRemoteDataSource{

  final SubjectExamApiClient subjectExamApiClient;

  SubjectExamRemoteDataSourceImpl(this.subjectExamApiClient);
  @override
  Future<SubjectExamResponse> getSubjectExam({required String subjectId})async {
    return await subjectExamApiClient.getSubjectExam(subjectId);
  }

}