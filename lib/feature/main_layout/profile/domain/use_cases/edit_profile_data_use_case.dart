import 'package:injectable/injectable.dart';

import '../../../../../core/config/api_result.dart';
import '../../data/model/requests/edit_profile_request.dart';
import '../entities/user_data_entity.dart';
import '../repo/profile_repo.dart';
@injectable
class EditProfileDataUseCase {
  final ProfileRepo profileRepo;

  EditProfileDataUseCase(this.profileRepo);

  Future<ApiResult<UserDataEntity>> call({
    required EditProfileRequest editProfileRequest,
  }) async {
    return await profileRepo.editProfileData(editProfileRequest: editProfileRequest);
  }
}
