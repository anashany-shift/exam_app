import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:exam_app/presentation/features/auth/forget_password/view/widgets/forget_password_screen_instructions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.onBack});
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              validator: Validation.validatePassword,
              label: "Confirm Password",
              hint: 'Confirmed password',
            ),
          ),
          SizedBox(height: 48.h),
          CustomButton(
            buttonModel: ButtonModel(text: "Continue", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
