part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

class ExamInitial extends ExamState {}

class QuestionSuccess extends ExamState {
  final List<QuestionEntity> questions;
  final ExamInfoEntity examInfoEntity;

  QuestionSuccess({required this.examInfoEntity, required this.questions});
}

class QuestionError extends ExamState {
  final String errorMessage;

  QuestionError(this.errorMessage);
}

class QuestionLoading extends ExamState {}
