import 'package:ellipsis_care/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Env {
  static String? flavor = appFlavor;
  static String baseUrl = const String.fromEnvironment('BACKEND_BASE_URL');
  static String sentryDSN = const String.fromEnvironment('SENTRY_DSN');

  static bool get isProd => flavor == "prod";
  static bool get isDev => flavor == "dev";
  static Color get color => switch (flavor) {
        "dev" => Colors.red,
        "prod" => Colors.transparent,
        _ => Color(0xA0B71C1C)
      };

  static void printEnvConfig() {
    UtilHelpers.logger.info("Env Configuration: $flavor");
  }
}
