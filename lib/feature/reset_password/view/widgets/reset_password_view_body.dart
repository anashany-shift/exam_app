import 'package:exam_app/core/helper/validation.dart';
import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/models/text_field_model.dart';
import 'package:exam_app/core/widget/custom_app_bar.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:exam_app/core/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                validator: Validation.validatePassword,
              ),
            ),
            SizedBox(height: 24.h),
            CustomTextFormField(
              textFormFieldModel: TextFormFieldModel(
                hint: "New password",
                label: "New password",
                obscureText: true,
                validator: Validation.validatePassword,
              ),
            ),
            SizedBox(height: 24.h), CustomTextFormField(
              textFormFieldModel: TextFormFieldModel(
                hint: "confirm password",
                label: "confirm password",
                obscureText: true,
                validator: Validation.validatePassword,
              ),
            ),
            SizedBox(height: 54.h),
            CustomButton(buttonModel: ButtonModel(text: "Update", onPressed: (){}))
          ],
        ),
      ),
    );
  }
}
