import 'package:exam_app/feature/main_layout/profile/api/client/profile_api_client.dart';
import 'package:exam_app/feature/main_layout/profile/data/data_source/profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/requests/change_password_request.dart';
import '../../data/model/requests/edit_profile_request.dart';
import '../../data/model/responses/change_password_response.dart';
import '../../data/model/responses/profile_data_response.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient profileApiClient;

  ProfileRemoteDataSourceImpl(this.profileApiClient);

  @override
  Future<ProfileDataResponse> getProfileData() async {
    return await profileApiClient.getProfileData();
  }

  @override
  Future<ProfileDataResponse> editProfileData({
    required EditProfileRequest editProfileRequest,
  }) async {
    return await profileApiClient.editProfileData(editProfileRequest);
  }

  @override
  Future<ChangePasswordResponse> changePassword({
    required ChangePasswordRequest changePasswordRequest,
  }) async{

    return await profileApiClient.changePassword(changePasswordRequest);

  }
}
