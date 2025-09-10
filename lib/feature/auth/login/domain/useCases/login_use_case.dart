import 'package:dartz/dartz.dart' show Either;
import 'package:exam_app/feature/auth/login/data/model/login_response.dart';
import 'package:exam_app/feature/auth/login/domain/entities/login_entity.dart';
import 'package:exam_app/feature/auth/login/domain/repos/login_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/error/failuer.dart';
import '../../data/model/login_request.dart';
@injectable
class LoginUseCase{
 final LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

 Future<Either<Failure,LoginEntity>> call({required LoginRequest loginRequest})async{
  return await loginRepo.login(loginRequest: loginRequest);
  }
}