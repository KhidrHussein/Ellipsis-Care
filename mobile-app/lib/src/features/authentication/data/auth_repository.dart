import 'package:ellipsis_care/src/features/authentication/models/signin/signin_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/services/secure_storage.dart';
import '../../../../core/utils/extensions.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/oauth_service.dart';
import '../../../../core/utils/injector.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../models/signup_response/signup_response.dart';

class AuthenticationRepository {
  AuthenticationRepository()
      : _service = injector<ApiService>(),
        _oAuthService = injector<OAuthService>();

  final ApiService _service;
  final OAuthService _oAuthService;

  Future<Either<SignupResponse, AppExceptions>> signUp(
      Map<String, dynamic> payload) async {
    try {
      final apiResponse = await _service.post(ApiUrl.signUp, data: payload);
      final signupResponse =
          SignupResponse.fromJson(apiResponse.data["data"]["user"]);

      return left(signupResponse);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<SigninResponse, AppExceptions>> signIn(
      Map<String, dynamic> payload) async {
    try {
      final response = await _service.post(ApiUrl.signIn, data: payload);

      final signin = SigninResponse.fromJson(response.data["data"]);
      await injector<SecureStorage>().storeAccessToken(signin.token);

      return left(signin);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<dynamic, AppExceptions>> verifyEmail(
      Map<String, dynamic> payload) async {
    try {
      final apiResponse =
          await _service.post(ApiUrl.verifyEmail, data: payload);

      return left(apiResponse.data);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<String, AppExceptions>> forgotPassword(
      Map<String, dynamic> payload) async {
    try {
      final apiResponse =
          await _service.post(ApiUrl.forgotPassword, data: payload);

      return left(apiResponse.data["message"]);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<OAuthCredentials?, AppExceptions>> signInWithGoogle() async {
    try {
      final result = await _oAuthService.signInWithGoogle();

      return left(result);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<OAuthCredentials?, AppExceptions>> signOutFromGoogle() async {
    try {
      final result = await _oAuthService.signOutFromGoogle();

      return left(result);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }
}
