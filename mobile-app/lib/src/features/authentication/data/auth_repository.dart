import 'package:ellipsis_care/core/utils/extensions.dart';

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

  Future<ApiResult<SuccessfulApiResponse<User>?, AppExceptions>> signUp(
      Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signUp, data: payload);

      final apiResult = SuccessfulApiResponse<User>.fromJson(
        response.data["user"],
        (json) => User.fromJson(json as Map<String, dynamic>),
      );

      return (response: apiResult, exception: null);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }

  Future<ApiResult<SuccessfulApiResponse?, AppExceptions>> signIn(
      Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signIn, data: payload);

      final apiResult = SuccessfulApiResponse<User>.fromJson(
        response.data["user"],
        (json) => User.fromJson(json as Map<String, dynamic>),
      );

      return (response: apiResult, exception: null);
    } on Exception catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }

  Future<ApiResult<SuccessfulApiResponse?, AppExceptions>> verifyEmail(
      Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.verifyEmail, data: payload);

      final apiResult = SuccessfulApiResponse.fromJson(
        response.data,
        (json) {},
      );

      return (response: apiResult, exception: null);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }

  Future<ApiResult<OAuthCredentials, AppExceptions>> signInWithGoogle() async {
    try {
      final result = await _oAuthService.signInWithGoogle();

      return (response: result, exception: null);
    } catch (e) {
      "$runtimeType Error: $e".printLog();

      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }

  Future<ApiResult<OAuthCredentials, AppExceptions>> signOutFromGoogle() async {
    try {
      final result = await _oAuthService.signOutFromGoogle();

      return (response: result, exception: null);
    } catch (e) {
      "$runtimeType Error: $e".printLog();

      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }
}
