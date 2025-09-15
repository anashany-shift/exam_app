import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/enter_email_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/reset_password_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/verify_code_request.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/enter_email_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/veify_code_entity.dart';

abstract class ForgetPasswordRepo {

  Future<ApiResult<EnterEmailEntity>> enterEmail({
    required EnterEmailRequest enterEmailRequest,
  });

  Future<ApiResult<VerifyCodeEntity>> verifyCode({
    required VerifyCodeRequest verifyCodeRequest,
  });

  Future<ApiResult<ResetPasswordEntity>> resetPassword({
    required ResetPasswordRequest resetPasswordRequest,
  });
}
