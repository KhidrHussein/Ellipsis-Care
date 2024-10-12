import '../../../../core/services/oauth_service.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/locator.dart';

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
