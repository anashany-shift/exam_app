import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/signup_entity.dart';

import '../../api/models/signup_request.dart';

abstract class SignupRepo {

  Future<ApiResult<SignupEntity>>signup({required SignupRequest signupRequest});
}