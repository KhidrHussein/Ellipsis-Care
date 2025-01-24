import 'package:ellipsis_care/core/api/response/api_response.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ellipsis_care/core/utils/typedef.dart';
import 'package:ellipsis_care/src/features/authentication/models/signin/signin_response.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/api/dio.dart';
import '../../../../core/utils/injector.dart';
import '../models/signup_response/signup_response.dart';

class AuthenticationRepository {
  AuthenticationRepository() : _service = injector<ApiService>();
  final ApiService _service;

  FutureEitherResponseOf<void> userExists(String email) async {
    try {
      final result =
          await _service.post(ApiUrl.userExist, data: {"email": email});

      final response = ApiResponse<void>.fromJson(result.data, (json) {});
      return left(response);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  FutureEitherResponseOf<SignupResponse> signUp(
      Map<String, dynamic> payload) async {
    try {
      final result = await _service.post(ApiUrl.signUp, data: payload);

      final response = ApiResponse<SignupResponse>.fromJson(
        result.data,
        (json) => SignupResponse.fromJson(json as Map<String, dynamic>),
      );

      return left(response);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  FutureEitherResponseOf<SigninResponse> signIn(
      Map<String, dynamic> payload) async {
    try {
      final result = await _service.post(ApiUrl.signIn, data: payload);

      final response = ApiResponse<SigninResponse>.fromJson(
        result.data,
        (json) => SigninResponse.fromJson(json as Map<String, dynamic>),
      );

      return left(response);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  FutureEitherResponseOf<dynamic> verifyEmail(
      Map<String, dynamic> payload) async {
    try {
      final apiResponse =
          await _service.post(ApiUrl.verifyEmail, data: payload);
      return left(apiResponse.data);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  FutureEitherResponseOf<String> forgotPassword(
      Map<String, dynamic> payload) async {
    try {
      final apiResponse =
          await _service.post(ApiUrl.forgotPassword, data: payload);
      return left(apiResponse.data["message"]);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  FutureEitherResponseOf<String> signUpWithGoogle(String? idToken) async {
    try {
      final response =
          await _service.post(ApiUrl.googleLogin, data: {"token": idToken});
      return left(response.data);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  // FutureEitherResponseOf<void> signOutFromGoogle() async {
  //   try {
  //     final result = await _oAuthService.signOutFromGoogle();
  //     return left(result);
  //   } on Exception catch (e) {
  //     return right(
  //       ClientException(message: e.toString()),
  //     );
  //   }
  // }
}
