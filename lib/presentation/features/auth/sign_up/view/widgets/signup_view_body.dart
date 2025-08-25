import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/routes/routes.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const CustomAppBar(title: "sign up"),
              
             
              SizedBox(height: 24.h),
              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
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
                        validator: Validation.validatePassword,
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
                  keyboardType: TextInputType.number,
                  validator: Validation.validateText,
        
                  label: "phone number",
                  hint: "Enter your phone number",
                ),
              ),
              SizedBox(height: 48.h),
              CustomButton(
                buttonModel: ButtonModel(
                  text: 'Signup',
        
                   onPressed: (){},
                   
                   
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
                      onTap: () => Navigator.pushNamed(context, Routes.login),
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
    );
  }
}
