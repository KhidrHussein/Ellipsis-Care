import 'package:ellipsis_care/config/app_config.dart';
import 'package:ellipsis_care/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Load the .env file based on the current flavor
  await dotenv.load(fileName: ".env.prod");

  AppConfig dev = AppConfig.fromEnv(appName: "Ellipsis Care(Dev)", flavor: "dev", color: Colors.red);
  initializeApp(dev);
}
