class ApiUrl {
  static const String signUp = "users/";
  static const String signIn = "auth/login/";
  static const String verifyEmail = "auth/verify-email/";

  static const String uploadAudio = "audio/";
  static String retrieveAudio(String id) => "audio/$id";
  static const updateAudio = retrieveAudio;
  static const deleteAudio = retrieveAudio;
}
