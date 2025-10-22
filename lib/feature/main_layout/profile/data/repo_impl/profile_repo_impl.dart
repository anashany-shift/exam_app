import 'package:dio/dio.dart';
import 'package:exam_app/feature/main_layout/profile/data/data_source/profile_remote_data_source.dart';
import 'package:exam_app/feature/main_layout/profile/data/model/responses/user_data_dto.dart';
import 'package:exam_app/feature/main_layout/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/api_result.dart';
import '../../../../../core/error/failuer.dart';
import '../../domain/entities/user_data_entity.dart';
import '../model/requests/change_password_request.dart';
import '../model/requests/edit_profile_request.dart';
import '../model/responses/change_password_response.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepoImpl(this.profileRemoteDataSource);
  @override
  Future<ApiResult<UserDataEntity>> getProfileData() async {
    try {
      final response = await profileRemoteDataSource.getProfileData();
      final entity = response.user?.toEntity();
      return ApiSuccessResult(entity!);
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(ServerFailure(e.toString()).errorMassage);
      }
    }
  }

  @override
  Future<ApiResult<UserDataEntity>> editProfileData({
    required EditProfileRequest editProfileRequest,
  }) async {
    try {
      final response = await profileRemoteDataSource.editProfileData(
        editProfileRequest: editProfileRequest,
      );
      final entity = response.user?.toEntity();
      return ApiSuccessResult(entity!);
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(ServerFailure(e.toString()).errorMassage);
      }
    }
  }

  @override
  Future<ApiResult<ChangePasswordResponse>> changePassword({
    required ChangePasswordRequest changePasswordRequest,
  }) async {
    try {
      final response = await profileRemoteDataSource.changePassword(
        changePasswordRequest: changePasswordRequest
      );

      return ApiSuccessResult(response);
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(ServerFailure(e.toString()).errorMassage);
      }
    }
  }
}
