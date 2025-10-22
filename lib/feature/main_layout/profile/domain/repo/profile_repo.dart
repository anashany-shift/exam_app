import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/main_layout/profile/domain/entities/user_data_entity.dart';

import '../../data/model/requests/change_password_request.dart';
import '../../data/model/requests/edit_profile_request.dart';
import '../../data/model/responses/change_password_response.dart';

abstract class ProfileRepo {
  Future<ApiResult<UserDataEntity>> getProfileData();
  Future<ApiResult<UserDataEntity>> editProfileData({
    required EditProfileRequest editProfileRequest,
  });
  Future<ApiResult<ChangePasswordResponse>> changePassword({
    required ChangePasswordRequest changePasswordRequest,
  });
}
