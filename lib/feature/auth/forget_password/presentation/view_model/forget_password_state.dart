part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

 class ForgetPasswordInitial extends ForgetPasswordState {}
 class EnterEmailSuccess extends ForgetPasswordState {
  final EnterEmailEntity emailEntity;
  EnterEmailSuccess({required this.emailEntity});
 }
 class EnterEmailError extends ForgetPasswordState {
  final String errorMessage;

  EnterEmailError({required this.errorMessage});
 }
 class EnterEmailLoading extends ForgetPasswordState {}



class VerifyCodeSuccess extends ForgetPasswordState {
 final VerifyCodeEntity verifyCodeEntity;
 VerifyCodeSuccess({required this.verifyCodeEntity});
}
class VerifyCodeError extends ForgetPasswordState {
 final String errorMessage;

 VerifyCodeError({required this.errorMessage});
}
class VerifyCodeLoading extends ForgetPasswordState {}


class ResetPasswordSuccess extends ForgetPasswordState {
 final ResetPasswordEntity resetPasswordEntity;
 ResetPasswordSuccess({required this.resetPasswordEntity});
}
class ResetPasswordError extends ForgetPasswordState {
 final String errorMessage;

 ResetPasswordError({required this.errorMessage});
}
class ResetPasswordLoading extends ForgetPasswordState {}










class ChangeIndex extends ForgetPasswordState {
 final int index;

  ChangeIndex(this.index);
}
