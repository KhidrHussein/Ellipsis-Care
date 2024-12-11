import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/injector.dart';
import '../models/home_response.dart';

class HomeRepository {
  HomeRepository() : _apiService = injector<ApiService>();

  final ApiService _apiService;

  Future<Either<HomeResponse, AppExceptions>> uploadAudio(File audio) async {
    final data = FormData.fromMap({
      "audio_file": await MultipartFile.fromFile(
        audio.path,
        contentType: DioMediaType("audio", "wav"),
      ),
    });

    try {
      final response = await _apiService.post(
        ApiUrl.uploadAudio,
        data: data,
        options: Options(responseType: ResponseType.bytes),
      );

      final result = HomeResponse(
        ai: response.headers.map["x-ai-response"]!,
        user: response.headers.map["x-transcription"]!,
        bytes: response.data,
        createdAt: DateTime.now().toIso8601String(),
      );

      return left(result);
    } catch (e) {
      final exception = AppExceptions.handleExceptions(e);
      "$runtimeType exception \n Exception Type: ${e.runtimeType} \n Exception Details: $e \n"
          .printLog();
      return right(exception);
    }
  }
}
