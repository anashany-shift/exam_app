import 'package:dio/dio.dart';
import 'package:exam_app/core/config/api_result.dart';
import 'package:exam_app/feature/auth/forget_password/data/datasources/forget_password_datasource.dart';

import 'package:exam_app/feature/auth/forget_password/data/model/requests/enter_email_request.dart';

import 'package:exam_app/feature/auth/forget_password/data/model/requests/reset_password_request.dart';

import 'package:exam_app/feature/auth/forget_password/data/model/requests/verify_code_request.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/forget_password_response.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/reset_password_response.dart';
import 'package:exam_app/feature/auth/forget_password/data/model/responses/verify_code_response.dart';

import 'package:exam_app/feature/auth/forget_password/domain/entities/enter_email_entity.dart';
import 'package:exam_app/feature/auth/forget_password/domain/entities/veify_code_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failuer.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../../domain/repos/forget_password_repo.dart';


@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo{
  final ForgetPasswordDataSource forgetPasswordDataSource;

  ForgetPasswordRepoImpl(this.forgetPasswordDataSource);

  @override
  Future<ApiResult<EnterEmailEntity>> enterEmail({required EnterEmailRequest enterEmailRequest}) async{
   try {
     var response=await forgetPasswordDataSource.enterEmail(enterEmailRequest: enterEmailRequest);
     final entity=response.toEntity();
     return ApiSuccessResult(entity);


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




  @override
  Future<ApiResult<ResetPasswordEntity>> resetPassword({required ResetPasswordRequest resetPasswordRequest}) async{
    try {
      var response=await forgetPasswordDataSource.resetPassword(resetPasswordRequest: resetPasswordRequest);
      final entity=response.toEntity();
      return ApiSuccessResult(entity);


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

  @override
  Future<ApiResult<VerifyCodeEntity>> verifyCode({required VerifyCodeRequest verifyCodeRequest}) async{
    try {
      var response=await forgetPasswordDataSource.verifyCode(verifyCodeRequest: verifyCodeRequest);
      final entity=response.toEntity();
      return ApiSuccessResult(entity);


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