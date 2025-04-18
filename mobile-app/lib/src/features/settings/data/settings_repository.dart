import '../../../../core/api/response/api_response.dart';
import '../../../../core/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';

import '../model/update_profile_response/update_profile_response.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/api/dio.dart';
import '../../../../core/utils/injector.dart';

class SettingsRepository {
  SettingsRepository() : _service = injector<ApiService>();

  final ApiService _service;

  FutureEitherResponseOf<UpdateProfileResponse> updateProfile(
      Map<String, dynamic> payload) async {
    try {
      final result = await _service.put(ApiUrl.updateProfile, data: payload);

      final response = ApiResponse<UpdateProfileResponse>.fromJson(
        result.data,
        (json) => UpdateProfileResponse.fromJson(json as Map<String, dynamic>),
      );

      return left(response);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  FutureEitherResponseOf<void> changePassword(
      Map<String, dynamic> payload) async {
    try {
      final result = await _service.post(ApiUrl.changePassword, data: payload);

      final response = ApiResponse<void>.fromJson(result.data, (json) {});
      return left(response);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }

  FutureEitherOf<void> logout() async {
    try {
      final result = await _service.post(ApiUrl.logout);
      return left(result.data);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return right(exception);
    }
  }
}
