import 'package:dio/dio.dart';
import 'package:exam_app/feature/main_layout/profile/data/model/responses/profile_data_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';
import '../../data/model/requests/change_password_request.dart';
import '../../data/model/requests/edit_profile_request.dart';
import '../../data/model/responses/change_password_response.dart';

part 'profile_api_client.g.dart';


@injectable
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio,) = _ProfileApiClient;

  @GET(ApiConstant.getProfileDataEndPoint)
  Future<ProfileDataResponse> getProfileData();

  
  @PUT(ApiConstant.editProfileDataEndPoint)
  Future<ProfileDataResponse> editProfileData(@Body()EditProfileRequest editProfileRequest);


  @PATCH(ApiConstant.changePasswordEndPoint)
  Future<ChangePasswordResponse> changePassword(@Body()ChangePasswordRequest changePasswordRequest);




}
