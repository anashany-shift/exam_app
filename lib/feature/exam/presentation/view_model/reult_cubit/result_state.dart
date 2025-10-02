part of 'result_cubit.dart';

@immutable
sealed class ResultState {}

 class ResultInitial extends ResultState {}
 class CheckQuestionLoading extends ResultState {}
 class CheckQuestionSuccess extends ResultState {
  final CheckQuestionEntity checkQuestionEntity;

  CheckQuestionSuccess({required this.checkQuestionEntity});

 }
 class CheckQuestionError extends ResultState {
  final String errorMessage;

  CheckQuestionError(this.errorMessage);
 }
