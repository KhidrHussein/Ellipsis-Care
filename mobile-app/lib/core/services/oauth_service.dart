import 'package:google_sign_in/google_sign_in.dart';

import '../utils/extensions.dart';

class OAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      return await _googleSignIn.signIn();
    } catch (e, s) {
      printLog(e: e, st: s);
      rethrow;
    }
  }

  Future<bool> checkIfSignedInWithGoogle() async {
    try {
      return await _googleSignIn.isSignedIn();
    } catch (e, s) {
      printLog(e: e, st: s);
      rethrow;
    }
  }

  Future<void> signOutFromGoogle() async {
    try {
      await _googleSignIn.signOut();
    } catch (e, s) {
      printLog(e: e, st: s);
      rethrow;
    }
  }
}
