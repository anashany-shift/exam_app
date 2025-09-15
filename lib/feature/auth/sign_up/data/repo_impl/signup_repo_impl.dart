import 'package:dio/dio.dart';
import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/sign_up/api/models/signup_response.dart';
import 'package:exam_app/feature/auth/sign_up/data/data_source.dart/signup_remote_datasource.dart';
import 'package:exam_app/feature/auth/sign_up/domain/entities/signup_entity.dart';
import 'package:exam_app/feature/auth/sign_up/domain/repos/signup_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failuer.dart';
import '../../api/models/signup_request.dart';

@Injectable(as: SignupRepo)
class SignupRepoImpl implements SignupRepo {
  final SignupRemoteDatasource signupRemoteDatasource;

  SignupRepoImpl({required this.signupRemoteDatasource});

  @override
  Future<ApiResult<SignupEntity>> signup({
    required SignupRequest signupRequest,
  }) async {
    try {
      final response = await signupRemoteDatasource.signUp(
        signupRequest: signupRequest,
      );
      final signupEntity=response.toEntity();
      return ApiSuccessResult(signupEntity);
    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(
          ServerFailure(e.toString()).errorMassage
        );
      }
    }
  }
}
