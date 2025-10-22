import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:exam_app/feature/main_layout/profile/view/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/widget/custom_progress_indicator.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if(state is ChangePasswordSuccess){
            Navigator.pop(context);
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(message: "Password Changed successful!"),
            );
            cubit.getProfileData();
            Navigator.pop(context);

          }if(state is ChangePasswordError){
            Navigator.pop(context);
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message:state.errorMessage ),
            );
          }if(state is ChangePasswordLoading){
            showDialog(
              context: context,
              builder: (context) {
                return const CustomProgressIndicator();
              },
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(title: "ResetPassword"),
              SizedBox(height: 32.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  hint: "current password",
                  label: "current password",
                  obscureText: true,
                  controller: cubit.oldPasswordController,
                  validator: Validation.validatePassword,
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  hint: "New password",
                  label: "New password",
                  controller: cubit.passwordController,
                  obscureText: true,
                  validator: Validation.validatePassword,
                ),
              ),
              SizedBox(height: 24.h), CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  hint: "confirm password",
                  label: "confirm password",
                  obscureText: true,
                  controller: cubit.rePasswordController,
                  validator: (value) =>Validation.validateConfirmedPassword(value, cubit.passwordController,) ,
                ),
              ),
              SizedBox(height: 54.h),
              CustomButton(
                  buttonModel: ButtonModel(text: "Update", onPressed: () {
                    cubit.changePassword();
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
