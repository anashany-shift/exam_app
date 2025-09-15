
import '../../api/models/signup_request.dart';
import '../../api/models/signup_response.dart';

abstract class SignupRemoteDatasource {

Future<SignupResponse>signUp({required SignupRequest signupRequest});

}