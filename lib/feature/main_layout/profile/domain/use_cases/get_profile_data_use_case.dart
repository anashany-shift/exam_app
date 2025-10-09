import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/main_layout/profile/domain/entities/user_data_entity.dart';
import 'package:exam_app/feature/main_layout/profile/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProfileDataUseCase{

  final ProfileRepo profileRepo;

  GetProfileDataUseCase(this.profileRepo);


  Future<ApiResult<UserDataEntity>>call()async{
    return await profileRepo.getProfileData();
  }
}