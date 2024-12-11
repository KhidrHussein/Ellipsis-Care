import 'package:flutter_dotenv/flutter_dotenv.dart';

class Secrets {
  static String baseUrl = dotenv.env['API_BASE_URL'] ?? "NO BASEURL";
  static String androidClientId =
      dotenv.env['ANDROID_CLIENT_ID'] ?? "No android ID";
  static String apiKey = dotenv.env['API_KEY'] ?? "No api key";
  static String iOSClientId = dotenv.env['iOS_CLIENT_ID'] ?? "No ios ID";
}
