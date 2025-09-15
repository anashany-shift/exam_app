import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/sign_up/api/models/signup_request.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/signup_entity.dart';
import 'package:exam_app/feature/auth/sign_up/domain/repos/signup_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  final SignupRepo signupRepo;

  SignupUseCase(this.signupRepo);

  Future<ApiResult<SignupEntity>>call({required SignupRequest signupRequest})async{

    return await signupRepo.signup(signupRequest: signupRequest);
  }

}