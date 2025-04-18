import 'package:fpdart/fpdart.dart';

import '../../../../core/api/response/api_response.dart';
import '../../../../core/utils/typedef.dart';
import '../models/signin/signin_response.dart';

import '../../../../core/api/dio.dart';
import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/utils/injector.dart';
import '../models/signup/signup_response.dart';

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

  FutureEitherResponseOf<SignupResponseNormal> signUp(
      Map<String, dynamic> payload) async {
    try {
      final result = await _service.post(ApiUrl.signUp, data: payload);

      final response = ApiResponse<SignupResponseNormal>.fromJson(
        result.data,
        (json) => SignupResponseNormal.fromJson(json as Map<String, dynamic>),
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

  FutureEitherResponseOf<void> verifyEmail(Map<String, dynamic> payload) async {
    try {
      final result = await _service.post(ApiUrl.verifyEmail, data: payload);

      final response = ApiResponse<void>.fromJson(result.data, (json) {});
      return left(response);
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

  FutureEitherResponseOf<SignupWithGoogleResponse> signUpWithGoogle(
      String? idToken) async {
    try {
      final result =
          await _service.post(ApiUrl.googleLogin, data: {"token": idToken});

      final response = ApiResponse<SignupWithGoogleResponse>.fromJson(
        result.data,
        (json) =>
            SignupWithGoogleResponse.fromJson(json as Map<String, dynamic>),
      );
      return left(response);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }
}
