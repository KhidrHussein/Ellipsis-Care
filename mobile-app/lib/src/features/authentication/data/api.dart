import 'package:ellipsis_care/core/constants/api_endpoints.dart';
import 'package:ellipsis_care/core/services/api_service.dart';
import 'package:ellipsis_care/core/utils/locator.dart';
import 'package:ellipsis_care/src/features/authentication/domain/user/user.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/api/response/response.dart';

class AuthenticationRepository {
  AuthenticationRepository() : _service = injector<ApiService>();

  final ApiService _service;

  Future<ApiResult<User>> signUp(Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signUp, data: payload);

      final result = ApiResponse.fromJson(
        response.data,
        (json) => User.fromJson(json as Map<String, dynamic>),
      );

      return (response: result, exception: null);
    } on Exception catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }

  Future<ApiResult<String>> signIn(Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signIn, data: payload);

      final result =
          ApiResponse<String>.fromJson(response.data, (json) => json as String);

      return (response: result, exception: null);
    } on Exception catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }
}
