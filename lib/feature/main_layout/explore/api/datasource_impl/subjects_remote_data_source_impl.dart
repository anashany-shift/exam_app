import 'package:injectable/injectable.dart';

import '../../data/datasources/remote_datasource/subject_remote_data_source.dart';
import '../../data/model/subject_response.dart';
import '../client/subjects_api_client.dart';
@Injectable(as:SubjectsRemoteDataSource )
class SubjectsRemoteDataSourceImpl implements SubjectsRemoteDataSource{
 final SubjectsApiClient subjectsApiClient;

  SubjectsRemoteDataSourceImpl(this.subjectsApiClient);


  @override
  Future<SubjectResponse> getSubjects()async {
   return await subjectsApiClient.getSubjects();

  }



}