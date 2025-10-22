import 'package:exam_app/feature/main_layout/profile/data/model/responses/profile_data_response.dart';

import '../model/requests/change_password_request.dart';
import '../model/requests/edit_profile_request.dart';
import '../model/responses/change_password_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileDataResponse> getProfileData();
  Future<ProfileDataResponse> editProfileData({
    required EditProfileRequest editProfileRequest,
  });

  Future<ChangePasswordResponse> changePassword({
    required ChangePasswordRequest changePasswordRequest,
  });
}
