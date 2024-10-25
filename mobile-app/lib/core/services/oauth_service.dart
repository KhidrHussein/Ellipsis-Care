import 'package:google_sign_in/google_sign_in.dart';

import '../utils/extensions.dart';

typedef OAuthCredentials = ({
  String? displayName,
  String? email,
  String? photoUrl,
});

class OAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<OAuthCredentials?> signInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      "Signed in: $account".printLog();

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

  Future<bool?> checkIfSignedInWithGoogle() async {
    try {
      return await _googleSignIn.isSignedIn();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
      return null;
    }
  }

  Future<OAuthCredentials?> signOutFromGoogle() async {
    try {
      final account = await _googleSignIn.signOut();
      "Signed out: $account".printLog();

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
