import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/extensions.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/oauth_service.dart';
import '../../../../core/utils/locator.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/api/response/response.dart';
import '../models/user/user.dart';

class AuthenticationRepository {
  AuthenticationRepository()
      : _service = injector<ApiService>(),
        _oAuthService = injector<OAuthService>();

  final ApiService _service;
  final OAuthService _oAuthService;

  Future<Either<SuccessfulApiResponse<User>, AppExceptions>> signUp(
      Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signUp, data: payload);

      final apiResult = SuccessfulApiResponse<User>.fromJson(
        response.data,
        (dataJson) {
          final json = dataJson as Map<String, dynamic>;
          return User.fromJson(json["user"]);
        },
      );

      return left(apiResult);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<SuccessfulApiResponse<String>, AppExceptions>> signIn(
      Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signIn, data: payload);

      final apiResult = SuccessfulApiResponse<String>.fromJson(
        response.data,
        (json) {
          final data = json as Map<String, dynamic>;
          return data["token"];
        },
      );

      return left(apiResult);
    } catch (e) {
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();

      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  Future<Either<SuccessfulApiResponse, AppExceptions>> verifyEmail(
      Map<String, dynamic> payload) async {
    try {
      final response =
          await _service.client.post(ApiUrl.verifyEmail, data: payload);

      final apiResult = SuccessfulApiResponse.fromJson(
        response.data,
        (json) {},
      );

      return left(apiResult);
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
