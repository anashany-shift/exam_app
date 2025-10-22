part of 'result_history_cubit.dart';

@immutable
sealed class ResultHistoryState {}

final class ResultHistoryInitial extends ResultHistoryState {}
final class ResultHistoryLoading extends ResultHistoryState {}
final class ResultHistorySuccess extends ResultHistoryState {
  final List<CompletedExam> completedExam;

  ResultHistorySuccess({required this.completedExam});
}
final class ResultHistoryError extends ResultHistoryState {
  final String errorMessage;

  ResultHistoryError(this.errorMessage);
}
