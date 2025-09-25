part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

class ExamInitial extends ExamState {}

class QuestionSuccess extends ExamState {
  final List<QuestionEntity> questions;
  final ExamInfoEntity examInfoEntity;
  final int currentPage;
  final bool examFinished;

  QuestionSuccess({
    required this.examInfoEntity,
    required this.questions,
    this.currentPage = 0,
    this.examFinished = false,
  });

  QuestionSuccess copyWith({int? currentPage, bool? examFinished}) {
    return QuestionSuccess(
      examInfoEntity: examInfoEntity,
      questions: questions,
      currentPage: currentPage ?? this.currentPage,
      examFinished: examFinished ?? this.examFinished,
    );
  }
}

class QuestionError extends ExamState {
  final String errorMessage;

  QuestionError(this.errorMessage);
}

class QuestionLoading extends ExamState {}
