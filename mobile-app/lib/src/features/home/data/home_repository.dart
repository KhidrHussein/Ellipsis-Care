import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ellipsis_care/src/features/home/models/transcribed_response.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/api/response/response.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/locator.dart';

class HomeRepository {
  HomeRepository() : _apiService = injector<ApiService>();

  final ApiService _apiService;

  Future<ApiResult<TranscribedResponse?, AppExceptions>> uploadAudio(
      File audio) async {
    final data = FormData.fromMap({
      "audio_file": await MultipartFile.fromFile(
        audio.path,
        contentType: DioMediaType("audio", "wav"),
      ),
    });

    try {
      final response =
          await _apiService.client.post(ApiUrl.uploadAudio, data: data);

      final apiResult = TranscribedResponse(
        aiResponse: response.headers.map["x-ai-response"]!,
        transcription: response.headers.map["x-transcription"]!,
        audio: response.data,
      );

      return (response: apiResult, exception: null);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      return (response: null, exception: exception);
    }
  }
}
