import 'package:google_sign_in/google_sign_in.dart';

import '../utils/extensions.dart';

typedef OAuthCredentials = ({
  String? displayName,
  String? email,
  String? photoUrl,
});

class OAuthService {
  Future<OAuthCredentials?> googleSignIn() async {
    final GoogleSignIn oAuth = GoogleSignIn();

    try {
      final account = await oAuth.signIn();
      "$account".printLog();

      return (
        displayName: account?.displayName,
        email: account?.email,
        photoUrl: account?.photoUrl
      );
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }
}
