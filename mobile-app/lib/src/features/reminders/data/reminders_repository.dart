import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/src/features/reminders/models/reminder_response.dart';

import '../../../../core/api/exceptions/exceptions.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/utils/injector.dart';

class ReminderRepository {
  ReminderRepository() : _apiService = injector<ApiService>();
  final ApiService _apiService;

  Future<Either<ReminderResponse, AppExceptions>> createReminder(
      Map<String, dynamic> payload) async {
    try {
      final response = await _apiService.post(
        ApiUrl.addReminder,
        data: payload,
        options: Options(responseType: ResponseType.bytes),
      );

      final result = ReminderResponse(
        title: response.headers.map["X-Reminder-Title"]!.first,
        description: response.headers.map["X-Reminder-Subtitle"]!.first,
        bytes: response.data,
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
