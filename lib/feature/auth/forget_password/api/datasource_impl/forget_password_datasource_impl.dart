import 'package:exam_app/feature/auth/forget_password/api/client/forget_password_api_client.dart';
import 'package:exam_app/feature/auth/forget_password/data/datasources/forget_password_datasource.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/enter_email_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/reset_password_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/verify_code_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/forget_password_response.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/responses/reset_password_response.dart';
import '../../data/model/responses/verify_code_response.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource{

  final ForgetPasswordApiClient forgetPasswordApiClient;

  ForgetPasswordDataSourceImpl(this.forgetPasswordApiClient);

  @override
  Future<ForgetPasswordResponse> enterEmail({required EnterEmailRequest enterEmailRequest})async {

    return await forgetPasswordApiClient.enterEmail(enterEmailRequest);
  }

  @override
  Future<ResetPasswordResponse> resetPassword({required ResetPasswordRequest resetPasswordRequest}) async{
    return await forgetPasswordApiClient.resetPassword(resetPasswordRequest);

  }

  @override
  Future<VerifyCodeResponse> verifyCode({required VerifyCodeRequest verifyCodeRequest}) async{
    return await forgetPasswordApiClient.verifyCode(verifyCodeRequest);

  }



}