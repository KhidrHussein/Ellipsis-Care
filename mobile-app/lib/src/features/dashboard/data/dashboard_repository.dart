import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/api/response/response.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/locator.dart';

class DashboardRepository {
  DashboardRepository() : _apiService = injector<ApiService>();

  final ApiService _apiService;

  Future<ApiResult<SuccessfulApiResponse?, AppExceptions>> uploadAudio(
      File audio) async {
        
    final data = FormData.fromMap({
      "audio_file": await MultipartFile.fromFile(
        audio.path,
        filename: "user_output.wav",
      ),
    });

    try {
      final response =
          await _apiService.client.post(ApiUrl.uploadAudio, data: data);

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
}
