import 'package:dio/dio.dart';
import 'package:exam_app/core/constants/api_constant.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/signup_request.dart';
import '../models/signup_response.dart';

part 'signup_api_client.g.dart';

@injectable
@RestApi()
abstract class SignupApiClient {
  @factoryMethod
  factory SignupApiClient(Dio dio,) = _SignupApiClient;

  @POST(ApiConstant.signUpEndPoint)
  Future<SignupResponse> signUp(@Body() SignupRequest signupRequest);
}
