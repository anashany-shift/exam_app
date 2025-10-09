import 'package:bloc/bloc.dart';
import 'package:exam_app/core/helper/token_storage.dart';
import 'package:exam_app/feature/main_layout/profile/data/model/requests/change_password_request.dart';
import 'package:exam_app/feature/main_layout/profile/data/model/requests/edit_profile_request.dart';
import 'package:exam_app/feature/main_layout/profile/data/model/responses/change_password_response.dart';
import 'package:exam_app/feature/main_layout/profile/domain/entities/user_data_entity.dart';
import 'package:exam_app/feature/main_layout/profile/domain/use_cases/change_password_use_case.dart';
import 'package:exam_app/feature/main_layout/profile/domain/use_cases/edit_profile_data_use_case.dart';
import 'package:exam_app/feature/main_layout/profile/domain/use_cases/get_profile_data_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/config/api_result.dart';

part 'profile_state.dart';

@singleton
class ProfileCubit extends Cubit<ProfileState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailNameController = TextEditingController();
  final TextEditingController phoneNameController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GetProfileDataUseCase getProfileDataUseCase;
  final EditProfileDataUseCase editProfileDataUseCase;
  final ChangePasswordUseCase changePasswordUseCase;

  ProfileCubit(
    this.getProfileDataUseCase,
    this.editProfileDataUseCase,
    this.changePasswordUseCase,
  ) : super(ProfileInitial());

  Future<void> getProfileData() async {
    emit(GetProfileDataLoading());

    try {
      var result = await getProfileDataUseCase.call();
      switch (result) {
        case ApiSuccessResult<UserDataEntity>():
          emit(GetProfileDataSuccess(userDataEntity: result.data));
          userNameController.text = result.data.username ?? "";
          firstNameController.text = result.data.firstName ?? "";
          lastNameController.text = result.data.lastName ?? "";
          emailNameController.text = result.data.email ?? "";
          phoneNameController.text = result.data.phone ?? "";

        case ApiErrorResult<UserDataEntity>():
          emit(GetProfileDataError(result.errorMessage));
      }
    } on Exception catch (e) {
      emit(GetProfileDataError(e.toString()));
    }
  }

  Future<void> editProfileData() async {
    try {
      var result = await editProfileDataUseCase.call(
        editProfileRequest: EditProfileRequest(
          username: userNameController.text,
          email: emailNameController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phone: phoneNameController.text,
        ),
      );
      switch (result) {
        case ApiSuccessResult<UserDataEntity>():
          emit(EditProfileDataSuccess(userDataEntity: result.data));
        case ApiErrorResult<UserDataEntity>():
          emit(EditProfileDataError(result.errorMessage));
      }
    } on Exception catch (e) {
      emit(GetProfileDataError(e.toString()));
    }
  }

  Future<void> changePassword() async {
    emit(ChangePasswordLoading());
    try {
      var result = await changePasswordUseCase.call(
        request: ChangePasswordRequest(
          oldPassword: oldPasswordController.text,
          password: passwordController.text,
          rePassword: rePasswordController.text,
        ),
      );
      switch (result) {
        case ApiSuccessResult<ChangePasswordResponse>():
          emit(ChangePasswordSuccess(changePasswordResponse: result.data));
          TokenStorage.deleteToken();
          TokenStorage.saveToken(result.data.token??'');
        case ApiErrorResult<ChangePasswordResponse>():
          emit(ChangePasswordError(result.errorMessage));
      }
    } on Exception catch (e) {
      emit(ChangePasswordError(e.toString()));
    }
  }
}
