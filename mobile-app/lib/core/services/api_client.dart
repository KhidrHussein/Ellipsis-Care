import 'package:dio/dio.dart';

class ApiClient {
  ApiClient._();
  static ApiClient instance = ApiClient._();
  factory ApiClient() => instance;

  final Dio apiClient = Dio();
}
