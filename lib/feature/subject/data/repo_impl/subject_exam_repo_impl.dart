import 'package:dio/dio.dart';
import 'package:exam_app/feature/subject/data/datasources/subject_exam_remote_data_source.dart';
import 'package:exam_app/feature/subject/data/models/subject_exam_dto.dart';
import 'package:exam_app/feature/subject/domain/repos/subject_exam_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/api_result.dart';
import '../../../../core/error/failuer.dart';
import '../../domain/entities/subject_exam_entity.dart';
@Injectable(as: SubjectExamRepo)
class SubjectExamRepoImpl implements SubjectExamRepo{

  final SubjectExamRemoteDataSource subjectExamRemoteDataSource;

  SubjectExamRepoImpl(this.subjectExamRemoteDataSource);
  @override
  Future<ApiResult<List<SubjectExamEntity>>> getSubjectExam({required String subjectId})async {

    try {
      final response = await subjectExamRemoteDataSource.getSubjectExam(subjectId: subjectId);

      List<SubjectExamEntity>subEntity=response.exams?.map((e) => e.toEntity(),).toList()??[];
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