import 'package:dio/dio.dart';
import 'package:exam_app/feature/main_layout/explore/data/model/subject_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/api_result.dart';
import '../../../../../core/error/failuer.dart';

import '../../domain/entities/subjects_entity.dart';
import '../../domain/repos/subjects_repo.dart';
import '../datasources/remote_datasource/subject_remote_data_source.dart';

@Injectable(as:SubjectsRepo )
class SubjectsRepoImpl implements SubjectsRepo{

  final SubjectsRemoteDataSource subjectsRemoteDataSource;

  SubjectsRepoImpl(this.subjectsRemoteDataSource);

  @override
  Future<ApiResult<List<SubjectEntity>>> getSubjects()async {

    try {
      final response = await subjectsRemoteDataSource.getSubjects();

     List<SubjectEntity>subEntity=response.subjects?.map((e) => e.toEntity(),).toList()??[];
      return ApiSuccessResult(subEntity);
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(
            ServerFailure(e.toString()).errorMassage
        );
      }
    }

  }

}