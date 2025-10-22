import 'package:dio/dio.dart';
import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/exam/data/datasource/exam_remote_datasource.dart';
import 'package:exam_app/feature/exam/data/mapper/completed_exam_mapper.dart';
import 'package:exam_app/feature/exam/data/models/check_question_response.dart';
import 'package:exam_app/feature/exam/data/models/questions_dto.dart';
import 'package:exam_app/feature/exam/data/models/requests/check_question_request.dart';
import 'package:exam_app/feature/exam/domain/entities/check_question_entity.dart';
import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';
import 'package:exam_app/feature/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failuer.dart';
import '../datasource/exam_local_datasource.dart';
import '../models/completed_exam.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource examRemoteDataSource;
  final ExamLocalDataSource examLocalDataSource;

  ExamRepoImpl(this.examRemoteDataSource, this.examLocalDataSource);

  @override
  Future<ApiResult<List<QuestionEntity>>> getQuestion({
    required String examId,
  }) async {
    try {
      final questionResponse = await examRemoteDataSource.getQuestions(
        examId: examId,
      );
      final questionEntity =
          questionResponse.questionsDto?.map((e) => e.toEntity()).toList() ??
          [];
      return ApiSuccessResult(questionEntity);
    } on Exception catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(ServerFailure(e.toString()).errorMassage);
      }
    }
  }

  @override
  Future<ApiResult<CheckQuestionEntity>> checkQuestion({
    required CheckQuestionRequest checkQuestionRequest,
    required List<QuestionEntity> questions,
  }) async {
    try {
      final checkQuestionResponse = await examRemoteDataSource.checkQuestions(
        checkQuestionRequest: checkQuestionRequest,
      );
      final checkQuestionEntity = checkQuestionResponse.toEntity();
      final completedExam = CompletedExam()
        ..examId = questions.first.examInfoEntity!.examId!
        ..examName = questions.first.examInfoEntity!.title!
        ..questions = questions.map((q) => q.toHive()).toList()
        ..userAnswers = { for (var item in checkQuestionRequest.answers??[])item.questionId ??'': item.correct??'' }
        ..result = checkQuestionEntity.toHive()
        ..completedDate = DateTime.now();
      await examLocalDataSource.saveCompletedExam(completedExam);

      return ApiSuccessResult(checkQuestionEntity);
    } on Exception catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(ServerFailure(e.toString()).errorMassage);
      }
    }
  }
  @override
  Future<List<CompletedExam>> getCompletedExams() async {
    return await examLocalDataSource.getCompletedExams();
  }
}
