import 'package:dio/dio.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/enter_email_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/reset_password_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/requests/verify_code_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/forget_password_response.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/reset_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../../core/constants/api_constant.dart';
import '../../data/model/responses/verify_code_response.dart';
part 'forget_password_api_client.g.dart';
@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio,) = _ForgetPasswordApiClient;

  @POST(ApiConstant.enterEmailEndPoint)
  Future<ForgetPasswordResponse> enterEmail(@Body() EnterEmailRequest enterEmailRequest);


  @POST(ApiConstant.verifyResetCodeEndPoint)
  Future<VerifyCodeResponse> verifyCode(@Body() VerifyCodeRequest verifyCodeRequest);


  @PUT(ApiConstant.restPasswordEndPoint)
  Future<ResetPasswordResponse> resetPassword(@Body() ResetPasswordRequest resetPasswordRequest);

}
