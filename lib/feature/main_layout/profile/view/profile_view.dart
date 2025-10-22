import 'package:exam_app/core/helper/token_storage.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/widget/custom_progress_indicator.dart';
import 'package:exam_app/feature/main_layout/profile/view/view_model/profile_cubit.dart';
import 'package:exam_app/feature/main_layout/profile/view/widgets/profile_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
    var cubit = context.read<ProfileCubit>();

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is EditProfileDataSuccess){
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(message: "Edit profile successful!"),
          );
          cubit.getProfileData();
        }if(state is EditProfileDataError){
          showTopSnackBar(
            Overlay.of(context),
             CustomSnackBar.error(message:state.errorMessage ),
          );
        }if(state is EditProfileDataLoading){
          showDialog(
            context: context,
            builder: (context) {
              return const CustomProgressIndicator();
            },
          );
        }
      },
      builder: (context, state) {
        if (state is GetProfileDataLoading) {
          return const Center(child: CustomProgressIndicator());
        } else if (state is GetProfileDataError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetProfileDataSuccess) {
          final userData = state.userDataEntity;
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
                    controller: cubit.userNameController,
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
                          hint: userData.firstName ?? "",
                          controller: cubit.firstNameController,
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
                          controller: cubit.lastNameController,
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
                    controller: cubit.emailNameController,
                    readOnly: true
                  ),
                ),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  textFormFieldModel: TextFormFieldModel(
                    validator: Validation.validatePassword,
                    obscureText: true,
                    readOnly: true,
                    label: "Password",
                    controller: TextEditingController(text: "000000"),

                    hint: "Enter password",
                    suffix: InkWell(
                      onTap: () {
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
                    label: "Phone number",
                    hint: "Enter your phone number",
                    controller: cubit.phoneNameController,
                  ),
                ),
                SizedBox(height: 48.h),
                CustomButton(
                  buttonModel: ButtonModel(text: 'update', onPressed: () {
                    cubit.editProfileData();
                  }),
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  buttonModel: ButtonModel(
                    text: 'log out',
                    onPressed: () {
                      TokenStorage.deleteAll();
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
