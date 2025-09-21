import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';
import 'package:exam_app/feature/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetQuestionUseCase{

  final ExamRepo examRepo;

  GetQuestionUseCase(this.examRepo);

  Future<ApiResult<List<QuestionEntity>>>call({required String examId})async{

    return await examRepo.getQuestion(examId: examId);



  }


}