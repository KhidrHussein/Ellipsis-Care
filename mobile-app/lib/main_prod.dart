import 'package:ellipsis_care/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/app_config.dart';

void main() async {
  // Load the .env file based on the current flavor
  await dotenv.load(fileName: ".env.prod");

  AppConfig prod = AppConfig.fromEnv(appName: "Ellipsis Care", flavor: "prod");
  initializeApp(prod);
}
