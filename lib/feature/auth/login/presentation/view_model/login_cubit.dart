import 'package:bloc/bloc.dart';
import 'package:exam_app/feature/auth/login/data/model/login_response.dart';
import 'package:exam_app/feature/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/feature/auth/login/domain/useCases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/login_request.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LoginUseCase useCase;
  LoginCubit(this.useCase,)
    : super(LoginInitial());

  Future<void> login() async {
    emit(LoginLoading());

    try {
      var result = await useCase.call(
        loginRequest:LoginRequest(
          email: emailController.text,
          password: passwordController.text,
        )
      );
      result.fold(
        (failure) => emit(LoginError(failure.errorMessage)),
        (loginEntity) => emit(LoginSuccess(loginEntity:loginEntity )),
      );
    } on Exception catch (e) {
      emit(LoginError(e.toString()));
    }
  }
  loginValidate({required GlobalKey<FormState> formKey}){
    if (formKey.currentState!.validate()){
      login();
    }


  }
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

}
