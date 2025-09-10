import 'package:exam_app/feature/auth/login/presentation/view/widgets/remember_forget_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/validation.dart';
import '../../../../../../core/models/button_model.dart';
import '../../../../../../core/models/text_field_model.dart';
import '../../../../../../core/routes/routes.dart';
import '../../../../../../core/widget/custom_button.dart';
import '../../../../../../core/widget/custom_text_form_field.dart';
import '../../view_model/login_cubit.dart';

class LoginBuilder extends StatelessWidget {
  const LoginBuilder({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
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
                Text('Login', style: theme.textTheme.titleLarge),
                SizedBox(height: 24.h),

                CustomTextFormField(
                  textFormFieldModel: TextFormFieldModel(
                    controller: cubit.emailController,
                    label: "Email",
                    hint: "Enter your email",
                    validator: Validation.validateEmail,
                  ),
                ),
                SizedBox(height: 24.h),

                CustomTextFormField(
                  textFormFieldModel: TextFormFieldModel(
                    controller: cubit.passwordController,
                    validator: Validation.validatePassword,
                    label: "password",
                    hint: "Enter your password",
                    obscureText: true,
                  ),
                ),

                SizedBox(height: 16.h),

                const RemeberAndForgetSection(),
                SizedBox(height: 48.h),

                CustomButton(
                  buttonModel: ButtonModel(
                    text: "Login",
                    onPressed: () {
                      cubit.loginValidate(formKey: cubit.formKey);
                    },
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
                      onTap: () => Navigator.pushReplacementNamed(
                        context,
                        Routes.signUp,
                      ),
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
      ),
    );
  }
}
