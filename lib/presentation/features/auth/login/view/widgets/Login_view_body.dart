import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:exam_app/presentation/features/auth/login/view/widgets/remember_forget_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/models/button_model.dart';
import '../../../../../../core/models/text_field_model.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login', style: theme.textTheme.titleLarge),
              SizedBox(height: 24.h),


              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  label: "Email",
                  hint: "Enter your email",
                  validator: Validation.validateEmail,
                ),
              ),
              SizedBox(height: 24.h),
              

              CustomTextFormField(
                textFormFieldModel: TextFormFieldModel(
                  validator: Validation.validatePassword,
                  label: "password",
                  hint: "Enter your password",
                  obscureText: true,
                ),
              ),

              SizedBox(height: 16.h),
              RemeberAndForgetSection(),
              SizedBox(height: 48.h),

              CustomButton(
                buttonModel: ButtonModel(
                  text: "Login",
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.mainLayout,
                      (route) => false,
                    );
                  },
                  height: 48.h,
                ),
              ),
              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: theme.textTheme.bodyLarge,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, Routes.signUp),
                    child: Text(
                      'Sign up ',
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
