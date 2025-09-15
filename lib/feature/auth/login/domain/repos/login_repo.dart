import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/login/domain/entities/login_entity.dart';

import '../../data/model/login_request.dart';

abstract class LoginRepo{
  Future<ApiResult<LoginEntity>>login({required LoginRequest loginRequest});
}