import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/locator.dart';
import '../models/data_from_ai.dart';

class HomeRepository {
  HomeRepository() : _apiService = injector<ApiService>();

  final ApiService _apiService;

  Future<Either<DataFromAI, AppExceptions>> uploadAudio(File audio) async {
    final data = FormData.fromMap({
      "audio_file": await MultipartFile.fromFile(
        audio.path,
        contentType: DioMediaType("audio", "wav"),
      ),
    });

    try {
      final response = await _apiService.client.post(
        ApiUrl.uploadAudio,
        data: data,
        options: Options(responseType: ResponseType.bytes),
      );

      // Save the audio file locally
      final Directory tempDir = await getTemporaryDirectory();
      final String filePath = "${tempDir.path}/response_audio.wav";

      //Write to file
      final File audioFile = File(filePath);
      await audioFile.writeAsBytes(response.data!);

      final result = DataFromAI(
        aiResponse: response.headers.map["x-ai-response"]!,
        transcription: response.headers.map["x-transcription"]!,
        pathToAudiFile: filePath,
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
