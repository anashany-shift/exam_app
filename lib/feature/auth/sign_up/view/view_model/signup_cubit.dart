import 'package:bloc/bloc.dart';
import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/sign_up/api/models/signup_request.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/signup_entity.dart';
import 'package:exam_app/feature/auth/sign_up/domain/useCases/signup_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

part 'signup_state.dart';
@injectable
class SignupCubit extends Cubit<SignupState> {
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  final TextEditingController rePasswordController= TextEditingController();
  final TextEditingController phoneController= TextEditingController();
  final TextEditingController firstNameController= TextEditingController();
  final TextEditingController lastNameController= TextEditingController();
  final TextEditingController userNameNameController= TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final SignupUseCase signupUseCase;
  SignupCubit(this.signupUseCase) : super(SignupInitial());

  Future<void>signup()async{
    emit(SignupLoading());

    try {
      var result=await signupUseCase.call(signupRequest: SignupRequest(
        email:emailController.text ,
        password: passwordController.text,
        rePassword:rePasswordController.text ,
        phone:phoneController.text ,
        firstName:firstNameController.text ,
        lastName: lastNameController.text,
        username: userNameNameController.text,
      ));

      switch(result){
        case ApiSuccessResult<SignupEntity>successResult:
          emit(SignupSuccess(signupEntity: successResult.data));
          break;
        case ApiErrorResult<SignupEntity>errorResult:
          emit(SignupError(errorResult.errorMessage));
      }

    } on Exception catch (e) {
     emit(SignupError(e.toString()));
    }

  }
  signupValidate({required GlobalKey<FormState> formKey}){
    if (formKey.currentState!.validate()){
      signup();
    }


  }

}
