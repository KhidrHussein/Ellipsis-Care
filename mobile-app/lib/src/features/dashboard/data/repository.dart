import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/locator.dart';

class DashboardRepository {
  DashboardRepository() : _service = injector<ApiService>();

  final ApiService _service;
  // Future<HealthTip?> sendAudioFile(File payload) async {
  //   final data = FormData.fromMap({
  //     "audio_file": await MultipartFile.fromFile(payload.path,
  //         filename: "user_output.wav"),
  //   });

  //   try {
  //     final response =
  //         await _service.client.post(ApiUrl.uploadAudio, data: data);
  //     if (response.statusCode == 201) {
        
  //       return HealthTip.fromMap(response.data);
  //     } else {
  //       "FAILED: ${response.statusMessage} with code: ${response.statusCode}"
  //           .printLog();
  //       return null;
  //     }
  //   } catch (e) {
  //     'API EXCEPTION: $e'.printLog();
  //     return null;
  //   }
  // }
}
