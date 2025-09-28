part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

class ExamInitial extends ExamState {}

class QuestionSuccess extends ExamState {
  final List<QuestionEntity> questions;
  final ExamInfoEntity examInfoEntity;
  final int currentPage;
  final Map<String,String>selectedAnswers;
  final bool examFinished;

  QuestionSuccess({
    required this.examInfoEntity,
    required this.questions,
    this.currentPage = 0,
    this.selectedAnswers=const {},
    this.examFinished = false,

  });

  QuestionSuccess copyWith({
    List<QuestionEntity>? questions,
    ExamInfoEntity? examInfoEntity,
    int? currentPage,
    bool? examFinished,
    Map<String, String>? selectedAnswers,
  }) {
    return QuestionSuccess(
      questions: questions ?? this.questions,
      examInfoEntity: examInfoEntity ?? this.examInfoEntity,
      currentPage: currentPage ?? this.currentPage,
      examFinished: examFinished ?? this.examFinished,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}

class QuestionError extends ExamState {
  final String errorMessage;

  QuestionError(this.errorMessage);
}

class QuestionLoading extends ExamState {}
