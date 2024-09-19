import 'package:ellipsis_care/core/services/oauth_service.dart';
import 'package:ellipsis_care/core/utils/extensions.dart';
import 'package:ellipsis_care/core/utils/locator.dart';

class OAuthRepository {
  OAuthRepository() : _oAuthService = injector<OAuthService>();
  final OAuthService _oAuthService;

  Future signInWithGoogle() async {
    try {
      await _oAuthService.googleSignIn();
    } catch (e) {
      "$runtimeType Error: $e".printLog();
    }
  }
}
