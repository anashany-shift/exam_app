import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/exam/domain/repo/exam_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/requests/check_question_request.dart';
import '../entities/check_question_entity.dart';
import '../entities/question_entity.dart';

@injectable
class CheckQuestionUseCase{
  final ExamRepo examRepo;

  CheckQuestionUseCase(this.examRepo);

  Future<ApiResult<CheckQuestionEntity>>call({required CheckQuestionRequest checkQuestionRequest,required List<QuestionEntity> questions, })async{
    return await examRepo.checkQuestion(checkQuestionRequest: checkQuestionRequest, questions: questions);
  }
}