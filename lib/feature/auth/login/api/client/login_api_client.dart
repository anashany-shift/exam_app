import 'package:dio/dio.dart';
import 'package:exam_app/feature/auth/login/data/model/login_request.dart';
import 'package:exam_app/feature/auth/login/data/model/login_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/api_constant.dart';

part 'login_api_client.g.dart';


@injectable
@RestApi()
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio,) = _LoginApiClient;

  @POST(ApiConstant.loginEndPoint)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
