import 'package:bloc/bloc.dart';
import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/exam/domain/entities/exam_info_entity.dart';
import 'package:exam_app/feature/exam/domain/entities/question_entity.dart';
import 'package:exam_app/feature/exam/domain/useCases/get_question_useCase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';


part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetQuestionUseCase getQuestionUseCase;

  final PageController pageController = PageController();
  bool isDialogShown = false;

  ExamCubit(this.getQuestionUseCase) : super(ExamInitial());

  Future<void> getQuestions({required String examId}) async {
    emit(QuestionLoading());

    try {
      var result = await getQuestionUseCase.call(examId: examId);
      switch (result) {
        case ApiSuccessResult<List<QuestionEntity>>():
          if (result.data.isNotEmpty &&
              result.data.first.examInfoEntity != null) {
            emit(
              QuestionSuccess(
                questions: result.data,
                examInfoEntity: result.data.first.examInfoEntity!,
              ),
            );
          } else {
            emit(QuestionError("No exam info or questions found"));
          }
        case ApiErrorResult<List<QuestionEntity>>():
          emit(QuestionError(result.errorMessage));
      }
    } on Exception catch (e) {
      emit(QuestionError(e.toString()));
    }
  }

  void nextPage() {
    if (state is QuestionSuccess) {
      final currentState = state as QuestionSuccess;
      final totalQuestions = currentState.questions.length;

      if (currentState.currentPage < totalQuestions - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        finishExam();
      }
    }
  }

  void previousPage() {
    if (state is QuestionSuccess) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int index) {
    if (state is QuestionSuccess) {
      final currentState = state as QuestionSuccess;
      emit(currentState.copyWith(currentPage: index));
    }
  }

   void finishExam() {
    if (state is QuestionSuccess) {
      final currentState = state as QuestionSuccess;
      if (!currentState.examFinished) {
        emit(currentState.copyWith(examFinished: true));
      }
    }
  }
  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
