import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/locator.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/api/response/response.dart';

class AuthenticationRepository {
  AuthenticationRepository() : _service = injector<ApiService>();

  final ApiService _service;

  Future<ApiResult<String>> signUp(Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signUp, data: payload);

      return (response: response.data as String, exception: null);
    } on Exception catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }

  Future<ApiResult<String>> signIn(Map<String, dynamic> payload) async {
    try {
      final response = await _service.client.post(ApiUrl.signIn, data: payload);

      return (response: "", exception: null);
    } on Exception catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }
}
