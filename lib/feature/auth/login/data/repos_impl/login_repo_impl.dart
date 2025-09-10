import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exam_app/feature/auth/login/data/model/login_request.dart';
import 'package:exam_app/feature/auth/login/data/model/login_response.dart';
import 'package:exam_app/feature/auth/login/data/datasources/login_remote_data_source.dart';
import 'package:exam_app/feature/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/feature/auth/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/failuer.dart';

@Injectable(as: LoginRepo)
class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl(this.loginRemoteDataSource);
  @override
  Future<Either<Failure, LoginEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();



    try {
      final response = await loginRemoteDataSource.login(
        loginRequest: loginRequest,
      );
      final entity=response.toEntity();
      
      prefs.setString("token", response.token??'');
      return right(entity);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDio(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
}
}