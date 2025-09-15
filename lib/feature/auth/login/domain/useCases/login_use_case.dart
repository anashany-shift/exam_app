import 'package:exam_app/feature/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/feature/auth/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/api_result.dart';
import '../../data/model/login_request.dart';
@injectable
class LoginUseCase{
 final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

 Future<ApiResult<LoginEntity>> call({required LoginRequest loginRequest})async{
  return await loginRepo.login(loginRequest: loginRequest);
  }
}