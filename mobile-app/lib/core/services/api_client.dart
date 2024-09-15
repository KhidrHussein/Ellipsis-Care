import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_endpoints.dart';

class ApiClient {
  ApiClient._();
  static ApiClient instance = ApiClient._();
  factory ApiClient() => instance;

  final Dio apiClient = Dio(
    BaseOptions(
        baseUrl: ApiUrl.baseUrl,
        headers: {
          "Authorization": "Token 9693f39db156ffad61c21b58fb9eb80a3aa7dade"
        },
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2)),
  )..interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ),
    );
}