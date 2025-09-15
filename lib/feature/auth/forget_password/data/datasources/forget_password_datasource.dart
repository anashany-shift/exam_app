import 'package:exam_app/feature/auth/forget_password/data/model/requests/enter_email_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/reset_password_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/verify_code_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/forget_password_response.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/reset_password_response.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/verify_code_response.dart';

abstract class ForgetPasswordDataSource {
  Future<ForgetPasswordResponse> enterEmail({
    required EnterEmailRequest enterEmailRequest,
  });

  Future<VerifyCodeResponse> verifyCode({
    required VerifyCodeRequest verifyCodeRequest,
  });

  Future<ResetPasswordResponse> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  });
}
