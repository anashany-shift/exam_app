import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/main_layout/profile/data/model/responses/change_password_response.dart';
import 'package:exam_app/feature/main_layout/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/requests/change_password_request.dart';

@injectable
class ChangePasswordUseCase{
  final ProfileRepo profileRepo;

  ChangePasswordUseCase(this.profileRepo);

  Future<ApiResult<ChangePasswordResponse>>call({required ChangePasswordRequest request})async{
    return await profileRepo.changePassword(changePasswordRequest: request);
  }
}