import 'package:exam_app/feature/auth/sign_up/api/client/signup_api_client.dart';
import 'package:exam_app/feature/auth/sign_up/data/data_source.dart/signup_remote_datasource.dart';
import 'package:injectable/injectable.dart';

import '../models/signup_request.dart';
import '../models/signup_response.dart';

@Injectable(as :SignupRemoteDatasource)
class SignupRemoteDatasourceImpl implements SignupRemoteDatasource {
  final SignupApiClient signupApiClient;

  SignupRemoteDatasourceImpl(this.signupApiClient);
  @override
  Future<SignupResponse> signUp({required SignupRequest signupRequest}) async {
  return  await signupApiClient.signUp(signupRequest);
  }
}
