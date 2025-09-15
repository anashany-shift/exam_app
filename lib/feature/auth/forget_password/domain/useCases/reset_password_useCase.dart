import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/reset_password_request.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;

  ResetPasswordUseCase(this.forgetPasswordRepo);

  Future<ApiResult<ResetPasswordEntity>> call({
    required ResetPasswordRequest resetPasswordRequest,
  })async {

    return await forgetPasswordRepo.resetPassword(resetPasswordRequest: resetPasswordRequest);
  }
}
