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

import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/widget/custom_progress_indicator.dart';
import 'forget_password_screen_instructions.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgetPasswordCubit>();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
       if(state is ResetPasswordSuccess){
         Navigator.of(context).pop();
         showTopSnackBar(
           Overlay.of(context),
           const CustomSnackBar.success(message: "Reset Password success"),
         );
         Navigator.pushNamedAndRemoveUntil(
           context,
           Routes.login,
               (route) => false,
         );
       }else if(state is ResetPasswordError){
         Navigator.of(context).pop(); // Close loading dialog
         showTopSnackBar(
           Overlay.of(context),
           CustomSnackBar.error(message: state.errorMessage),
         );
       }else if(state is ResetPasswordLoading){
         showDialog(
           context: context,
           builder: (context) {
             return const AlertDialog(
               elevation: 0,
               backgroundColor: Colors.transparent,
               title: Center(child: CustomProgressIndicator()),
             );
           },
         );
       }
      },
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomAppBar(title: "Password", onTap: onBack),
              SizedBox(height: 40.h),
              const ForgetPasswordScreenInstructions(
                title: "Reset password",
                subTitle:
                "Password must not be empty and must contain \n6 characters with upper case letter and one \nnumber at least  ",
              ),
              SizedBox(height: 32.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  controller: cubit.newPasswordController,
                  obscureText: true,
                  validator: Validation.validatePassword,
                  label: "New Password",
                  hint: 'Enter your password',
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  obscureText: true,
                  validator: (value) =>
                      Validation.validateConfirmedPassword(
                        value, cubit.newPasswordController,),
                  label: "Confirm Password",
                  hint: 'Confirmed password',
                ),
              ),
              SizedBox(height: 48.h),
              CustomButton(
                buttonModel: ButtonModel(text: "Continue", onPressed: () {
                  cubit.newPasswordValidate(formKey: cubit.formKey);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
