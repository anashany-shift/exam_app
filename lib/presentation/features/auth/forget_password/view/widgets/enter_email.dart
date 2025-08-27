import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'forget_password_screen_instructions.dart';

class EnterEmail extends StatelessWidget {
  final VoidCallback onContinue;
  const EnterEmail({super.key, required this.onContinue});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              label: "Email",
              hint: "Enter your Email",
              validator: Validation.validateEmail,
            ),
          ),
          SizedBox(height: 48.h),
          CustomButton(
            buttonModel: ButtonModel(text: "Continue", onPressed: onContinue),
          ),
        ],
      ),
    );
  }
}

