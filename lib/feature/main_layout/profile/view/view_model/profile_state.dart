part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileDataLoading extends ProfileState {}

class GetProfileDataSuccess extends ProfileState {
  final UserDataEntity userDataEntity;

  GetProfileDataSuccess({required this.userDataEntity});
}

class GetProfileDataError extends ProfileState {
  final String errorMessage;

  GetProfileDataError(this.errorMessage);
}





class EditProfileDataLoading extends ProfileState {}

class EditProfileDataSuccess extends ProfileState {
 final UserDataEntity userDataEntity;

 EditProfileDataSuccess({required this.userDataEntity});
}

class EditProfileDataError extends ProfileState {
 final String errorMessage;

 EditProfileDataError(this.errorMessage);
}

class ChangePasswordLoading extends ProfileState {}

class ChangePasswordSuccess extends ProfileState {
  final ChangePasswordResponse changePasswordResponse;

  ChangePasswordSuccess({required this.changePasswordResponse});
}

class ChangePasswordError extends ProfileState {
  final String errorMessage;

  ChangePasswordError(this.errorMessage);
}
