import 'package:dartz/dartz.dart';
import 'package:exam_app/core/error/failuer.dart';
import 'package:exam_app/feature/auth/login/data/model/login_response.dart';
import 'package:exam_app/feature/auth/login/domain/entities/login_entity.dart';

import '../../data/model/login_request.dart';

abstract class LoginRepo{
  Future<Either<Failure,LoginEntity>>login({required LoginRequest loginRequest});
}