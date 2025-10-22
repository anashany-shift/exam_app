import 'package:bloc/bloc.dart';
import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/exam/data/models/requests/check_question_request.dart';
import 'package:exam_app/feature/exam/domain/entities/check_question_entity.dart';
import 'package:exam_app/feature/exam/domain/useCases/check_question_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/question_entity.dart';

part 'result_state.dart';
@injectable
class ResultCubit extends Cubit<ResultState> {
  final CheckQuestionUseCase checkQuestionUseCase;
  ResultCubit(this.checkQuestionUseCase,) : super(ResultInitial());

  
  
  Future<void>checkQuestion({
    required CheckQuestionRequest request,
    required List<QuestionEntity> questions, // أضف هذا
  })async{
    emit(CheckQuestionLoading());
    try {

      var result=await checkQuestionUseCase.call(
        checkQuestionRequest: request,
        questions: questions
      );
      switch (result) {
        case ApiSuccessResult <CheckQuestionEntity>():
        emit(CheckQuestionSuccess(checkQuestionEntity:result.data ));
        print("✅ State emitted: CheckQuestionSuccess");
        case ApiErrorResult<CheckQuestionEntity>():
          emit(CheckQuestionError(result.errorMessage));
      }
    } on Exception catch (e) {
      emit(CheckQuestionError(e.toString()));
    }

  }
  
}
