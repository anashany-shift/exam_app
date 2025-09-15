part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

 class SignupInitial extends SignupState {}
 class SignupSuccess extends SignupState {
  final  SignupEntity signupEntity;

  SignupSuccess({required this.signupEntity});

}
 class SignupLoading extends SignupState {}
 class SignupError extends SignupState {
  final   String message;

  SignupError(this.message);
}
