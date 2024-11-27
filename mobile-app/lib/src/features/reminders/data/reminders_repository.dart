import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dio/dio.dart';
import 'package:ellipsis_care/src/features/reminders/models/notification_event.dart';
import 'package:ellipsis_care/src/features/reminders/models/notification_model.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/locator.dart';

class ReminderRepository {
  ReminderRepository() : _apiService = injector<ApiService>();
  final ApiService _apiService;

  Future<Either<CustomNotificationEventModel, AppExceptions>> createReminder(
      Map<String, dynamic> payload) async {
    try {
      final response = await _apiService.client.post(
        ApiUrl.addReminder,
        data: payload,
        options: Options(responseType: ResponseType.bytes),
      );

      // Save the audio file locally
      final Directory tempDir = await getTemporaryDirectory();
      final String filePath = "${tempDir.path}/notification_audio.wav";

      //Write to file
      final File audioFile = File(filePath);
      await audioFile.writeAsBytes(response.data!);

      final result = CustomNotificationEventModel(
        title: response.headers.map["X-Reminder-Title"]!.first,
        subTitle: response.headers.map["X-Reminder-Subtitle"]!.first,
        pathToAudioFile: filePath,
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
