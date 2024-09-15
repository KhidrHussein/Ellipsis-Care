import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ellipsis_care/core/services/api_client.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/dashboard/domain/health_tip.dart';

class DashboardRepository {
  final ApiClient _service = ApiClient.instance;

  Future<HealthTip?> sendAudioFile(File payload) async {
    final data = FormData.fromMap({
      "audio_file": await MultipartFile.fromFile(payload.path,
          filename: "user_output.opus"),
    });

    try {
      final response = await _service.apiClient.post('api/audio/', data: data);
      if (response.statusCode == 201) {
        return HealthTip.fromMap(response.data);
      } else {
        "FAILED: ${response.statusMessage} with code: ${response.statusCode}"
            .printLog();
        return null;
      }
    } catch (e) {
      'API EXCEPTION: $e'.printLog();
      return null;
    }
  }
}