import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  static String baseUrl = dotenv.env['API_CLIENT_URL'] ?? "NO BASEURL";

  static const String uploadAudio = "/audio";
  static String retrieveAudio(String id) => "/audio/$id";
  static const updateAudio = retrieveAudio;
  static const deleteAudio = retrieveAudio;
}
