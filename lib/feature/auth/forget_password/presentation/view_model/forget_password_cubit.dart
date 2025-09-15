import 'package:bloc/bloc.dart';
import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/verify_code_request.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/enter_email_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/veify_code_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/useCases/enter_email_useCase.dart';
import 'package:exam_app/feature/auth/forget_password/domain/useCases/reset_password_useCase.dart';
import 'package:exam_app/feature/auth/forget_password/domain/useCases/verify_code_useCase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/requests/enter_email_request.dart';
import '../../data/model/requests/reset_password_request.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final EnterEmailUseCase enterEmailUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController resetCodeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController pageController = PageController(initialPage: 0);
  String? userEmail;
  int selectedIndex = 0;
  ForgetPasswordCubit(this.enterEmailUseCase, this.verifyCodeUseCase, this.resetPasswordUseCase)
    : super(ForgetPasswordInitial());

  Future<void> enterEmail() async {
    emit(EnterEmailLoading());

    try {
      var result = await enterEmailUseCase.call(
        enterEmailRequest: EnterEmailRequest(email: emailController.text),
      );
      switch (result) {
        case ApiSuccessResult<EnterEmailEntity>():
          userEmail=emailController.text;
          emit(EnterEmailSuccess(emailEntity: result.data));

        case ApiErrorResult<EnterEmailEntity>():
          emit(EnterEmailError(errorMessage: result.errorMessage));
      }
    } on Exception catch (e) {
      emit(EnterEmailError(errorMessage: e.toString()));
    }
  }

  Future<void> verifyCode() async {
    emit(VerifyCodeLoading());

    try {
      var result = await verifyCodeUseCase.call(
        verifyCodeRequest: VerifyCodeRequest(
          resetCode: resetCodeController.text,
        ),
      );
      switch (result) {
        case ApiSuccessResult<VerifyCodeEntity>():
          emit(VerifyCodeSuccess(verifyCodeEntity: result.data));
        case ApiErrorResult<VerifyCodeEntity>():
          emit(VerifyCodeError(errorMessage: result.errorMessage));
      }
    } on Exception catch (e) {
      emit(VerifyCodeError(errorMessage: e.toString()));
    }
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());

    try {
      var result = await resetPasswordUseCase.call(
        resetPasswordRequest: ResetPasswordRequest(
          email: userEmail,
          newPassword: newPasswordController.text
        ),
      );
      switch (result) {
        case ApiSuccessResult<ResetPasswordEntity>():
          emit(ResetPasswordSuccess(resetPasswordEntity:result.data ));
        case ApiErrorResult<ResetPasswordEntity>():
          emit(ResetPasswordError(errorMessage: result.errorMessage));
      }
    } on Exception catch (e) {
      emit(ResetPasswordError(errorMessage: e.toString()));
    }
  }






  emailValidate({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      enterEmail();
    }
  }
  newPasswordValidate({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      resetPassword();
    }
  }

  codeValidate({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      verifyCode();
    }
  }

  void nextPage() {
    if (selectedIndex < 2) {
      emit(ChangeIndex(selectedIndex++));
      pageController.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (selectedIndex > 0) {
      emit(ChangeIndex(selectedIndex--));
      pageController.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    resetCodeController.dispose();
    emailController.dispose();
    return super.close();
  }
}
