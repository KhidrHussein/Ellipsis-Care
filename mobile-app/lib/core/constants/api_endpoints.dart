class ApiUrl {
  static const String uploadAudio = "/audio";
  static String retrieveAudio(String id) => "/audio/$id";
  static const updateAudio = retrieveAudio;
  static const deleteAudio = retrieveAudio;
}
