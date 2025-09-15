import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view_model/signup_cubit.dart';

class SignupBuilder extends StatelessWidget {
  const SignupBuilder({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
     var cubit=context.read<SignupCubit>();
         var theme = Theme.of(context);

    return SafeArea(
        
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(title: "sign up"),
        
        
                SizedBox(height: 24.h),
                CustomTextFormField(
                  textFormFieldModel: TextFormFieldModel(
                    controller: cubit.userNameNameController,
                    validator: Validation.validateText,
                    label: "User name",
                    hint: "Enter your user name",
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        textFormFieldModel: TextFormFieldModel(
                          controller: cubit.firstNameController,
                          validator: Validation.validateText,
                          label: "First name",
                          hint: "Enter first name",
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomTextFormField(
                        textFormFieldModel: TextFormFieldModel(
                          controller: cubit.lastNameController,
                          validator: Validation.validateText,
                          label: "Last name",
                          hint: "Enter last name",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  textFormFieldModel: TextFormFieldModel(
                    controller: cubit.emailController,
                    validator: Validation.validateEmail,
                    label: "Email",
                    hint: "Enter your email",
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
        
                        textFormFieldModel: TextFormFieldModel(
                          controller: cubit.passwordController,
                          validator: Validation.validatePassword,
                          obscureText: true,
                          label: "passwoed",
                          hint: "Enter password",
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomTextFormField(
                        textFormFieldModel: TextFormFieldModel(
                          controller: cubit.rePasswordController,
                          validator: (value) =>Validation.validateConfirmedPassword(
                            value,
                            cubit.passwordController,
                          ),
                          obscureText: true,
        
                          label: "Confirm password",
                          hint: "Confirmed password",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  textFormFieldModel: TextFormFieldModel(
                    controller: cubit.phoneController,
                    keyboardType: TextInputType.number,
                    validator: Validation.validateText,
        
                    label: "phone number",
                    hint: "Enter your phone number",
                  ),
                ),
                SizedBox(height: 48.h),
                CustomButton(
                  buttonModel: ButtonModel(
                    text: 'Sign up',
        
                    onPressed: () {
                      cubit.signupValidate(formKey: cubit.formKey);
                    },
        
        
                  ),
                ),
                SizedBox(height: 16.h),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: theme.textTheme.bodyLarge,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, Routes.login),
                      child: Text(
                        'Login',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
        
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
