import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../utils/helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../constants/interceptor.dart';

class ApiService with DioMixin implements Dio {
  ApiService({required this.baseUrl}) {
    options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
    );

    interceptors.add(AuthInterceptor());

    if (kDebugMode) {
      interceptors.addAll([
        LogmanDioInterceptor(),
        TalkerDioLogger(
          talker: UtilHelpers.logger,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
          ),
        ),
      ]);
    }

    httpClientAdapter = IOHttpClientAdapter();
  }

  final String baseUrl;
}
