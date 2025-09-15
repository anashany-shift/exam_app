import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/verify_code_request.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/veify_code_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;

  VerifyCodeUseCase(this.forgetPasswordRepo);

  Future<ApiResult<VerifyCodeEntity>>call({required VerifyCodeRequest verifyCodeRequest })async{
    return await forgetPasswordRepo.verifyCode(verifyCodeRequest: verifyCodeRequest);
  }

}