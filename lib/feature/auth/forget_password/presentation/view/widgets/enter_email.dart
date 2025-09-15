import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:exam_app/feature/auth/forget_password/presentation/view_model/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'forget_password_screen_instructions.dart';

class EnterEmail extends StatelessWidget {
  final VoidCallback onContinue;

  const EnterEmail({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    var cubit =context.read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        switch(state) {
          case ForgetPasswordInitial():
            break;
          case EnterEmailSuccess(emailEntity:final  entity):
          Navigator.of(context).pop();
          showTopSnackBar(
            Overlay.of(context),
             CustomSnackBar.success(message:entity.info),
          );
          onContinue();
          break;
          case EnterEmailError():
            Navigator.of(context).pop(); // Close loading dialog
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errorMessage),
            );
            break;
          case EnterEmailLoading():
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: Center(child: CircularProgressIndicator()),
                );
              },
            );
            break;
          case VerifyCodeSuccess():
          case VerifyCodeError():
          case VerifyCodeLoading():
          case ChangeIndex():
          case ResetPasswordSuccess():
          case ResetPasswordError():
          case ResetPasswordLoading():
            break;

        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              const CustomAppBar(title: "Password"),
              SizedBox(height: 40.h),
              const ForgetPasswordScreenInstructions(
                title: "Forget Password",
                subTitle: "Please enter your email associated to \nyour account",
              ),
              SizedBox(height: 32.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  controller: cubit.emailController,
                  label: "Email",
                  hint: "Enter your Email",
                  validator: Validation.validateEmail,
                ),
              ),
              SizedBox(height: 48.h),
              CustomButton(
                buttonModel: ButtonModel(text: "Continue", onPressed: (){

                  cubit.emailValidate(formKey: cubit.formKey);

                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

