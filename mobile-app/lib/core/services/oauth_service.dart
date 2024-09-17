import 'package:ellipsis_care/config/secrets.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class OAuthService {
  Future googleSignIn() async {
    final GoogleSignIn oAuth = GoogleSignIn(
        clientId: switch (defaultTargetPlatform) {
      TargetPlatform.android => Secrets.androidClientId,
      TargetPlatform.iOS => Secrets.iOSClientId,
      _ => ""
    });
    try {
      final account = await oAuth.signIn();
      "${account?.email}".printLog();
    } catch (e) {
      "An error occured in $this: $e".printLog();
    }
  }
}
