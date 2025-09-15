import 'package:exam_app/core/helper/token_storage.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/feature/main_layout/profile/view/widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/validation.dart';
import '../../../../../core/models/button_model.dart';
import '../../../../../core/models/text_field_model.dart';
import '../../../../../core/widget/custom_app_bar.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../core/widget/custom_text_form_field.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(title: "Profile", onTap: () {}),

          SizedBox(height: 24.h),

          const ProfilePhoto(),
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
          CustomTextFormField(
            textFormFieldModel: TextFormFieldModel(
              validator: Validation.validatePassword,
              obscureText: true,
              label: "password",
              hint: "Enter password",
              suffix: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, Routes.resetPassword);
                },
                child: Text(
                  "change",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
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
            buttonModel: ButtonModel(text: 'update', onPressed: () {}),
          ),
          SizedBox(height: 16.h),
          CustomButton(
            buttonModel: ButtonModel(text: 'log out', onPressed: () {
              TokenStorage.deleteToken();
              Navigator.pushReplacementNamed(context, Routes.login);

            }),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
