import 'package:exam_app/feature/auth/login/api/client/login_api_client.dart';
import 'package:exam_app/feature/auth/login/data/model/login_request.dart';
import 'package:exam_app/feature/auth/login/data/model/login_response.dart';
import 'package:exam_app/feature/auth/login/data/datasources/login_remote_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDateSourceImpl implements LoginRemoteDataSource{
final LoginApiClient loginApiClient;

  LoginRemoteDateSourceImpl(this.loginApiClient);
  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) {
   return  loginApiClient.login(loginRequest);
  }

}