
import 'package:exam_app/feature/auth/login/data/model/login_request.dart';

import '../model/login_response.dart';

abstract class LoginRemoteDataSource{
  Future<LoginResponse>login({required LoginRequest loginRequest});
}