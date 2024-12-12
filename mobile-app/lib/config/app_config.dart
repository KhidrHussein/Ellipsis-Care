import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  const AppConfig({
    required this.flavor,
    required this.baseUrl,
    required this.appName,
    this.color,
  });

  final String flavor;
  final Color? color;
  final String baseUrl;
  final String appName;

  factory AppConfig.fromEnv({
    required String appName,
    required String flavor,
    Color? color,
  }) {
    return AppConfig(
      flavor: flavor,
      color: color,
      appName: appName,
      baseUrl: _getEnv("API_BASE_URL"),
    );
  }

  static String _getEnv(String key) {
    return dotenv.env[key] ?? '';
  }
}
