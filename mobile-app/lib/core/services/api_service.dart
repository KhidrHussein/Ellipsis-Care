import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../config/secrets.dart';
import '../constants/interceptor.dart';

class ApiService with DioMixin implements Dio {
  ApiService._() {
    options = BaseOptions(
      baseUrl: Secrets.baseUrl,
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
    );

    interceptors.add(AuthInterceptor());

    if (kDebugMode) {
      interceptors.addAll([
        LogmanDioInterceptor(),
        PrettyDioLogger(
            requestBody: true, requestHeader: true, responseHeader: true),
      ]);
    }

    httpClientAdapter = IOHttpClientAdapter();
  }

  static get instance => ApiService._();
}
