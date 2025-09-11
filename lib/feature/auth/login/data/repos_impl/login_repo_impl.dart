import 'package:dio/dio.dart';
import 'package:exam_app/feature/auth/login/data/model/login_request.dart';
import 'package:exam_app/feature/auth/login/data/model/login_response.dart';
import 'package:exam_app/feature/auth/login/data/datasources/login_remote_data_source.dart';
import 'package:exam_app/feature/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/feature/auth/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/config/api_result.dart';
import '../../../../../core/error/failuer.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;
  

  LoginRepoImpl(this.loginRemoteDataSource);
  @override
  Future<ApiResult<LoginEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    

    try {
      final response = await loginRemoteDataSource.login(
        loginRequest: loginRequest,
      );
      // TokenStorage.saveToken(response.token??"");

      // final tokens=await TokenStorage.getToken();
      // print("tokennnns--------$tokens");
     



      final entity = response.toEntity();
      return ApiSuccessResult(entity);
      


    } catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDio(e).errorMessage);
      } else {
        return ApiErrorResult(
          ServerFailure(errorMessage: e.toString()).errorMessage,
        );
      }
    }
  }
}
