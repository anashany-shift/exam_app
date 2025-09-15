import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/enter_email_request.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/enter_email_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class EnterEmailUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;

  EnterEmailUseCase(this.forgetPasswordRepo);

  Future<ApiResult<EnterEmailEntity>>call({required EnterEmailRequest enterEmailRequest })async{
    return await forgetPasswordRepo.enterEmail(enterEmailRequest: enterEmailRequest);
  }

}