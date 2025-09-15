part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

 class LoginInitial extends LoginState {}
 class LoginLoading extends LoginState {}
 class LoginSuccess extends LoginState {
   final LoginEntity loginEntity;

  LoginSuccess({required this.loginEntity});
}
 class LoginError extends LoginState {
   final String errorMessage;

  LoginError( this.errorMessage);
}
LoginState getsate(){
  return LoginLoading();
}
class LoginRememberme extends LoginState {
  final bool isRemember;
  LoginRememberme(this.isRemember);
}