import '../../../../../core/api/response/response.dart';

abstract class BaseAuthenticationRepository {
  Future<ApiResult> signUp(String email, String password);
  Future<ApiResult> signIn(String email, String password);
  Future<ApiResult> verifyEmail(String otp);
  Future<ApiResult> forgotPassword(String email);
}
