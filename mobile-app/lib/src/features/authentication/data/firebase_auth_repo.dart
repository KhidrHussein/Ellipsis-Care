import '../../../../core/utils/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/api/response/response.dart';
import '../domain/repository/authentication_repo.dart';

class FirebaseAuthRepo implements BaseAuthenticationRepository {
  @override
  Future<ApiResult> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return (response: credential.user, exception: null);
    } on FirebaseAuthException catch (e) {
      "$runtimeType exception: $e".printLog();
      return (response: null, exception: null);
    }
  }

  @override
  Future<ApiResult> signUp(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return (response: credential.user, exception: null);
    } on FirebaseAuthException catch (e) {
      "$runtimeType exception: $e".printLog();
      return (response: null, exception: null);
    }
  }

  @override
  Future<ApiResult> forgotPassword(String email) async {
    try {
      final credential =
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      return (response: null, exception: null);
    } on FirebaseAuthException catch (e) {
      "$runtimeType exception: $e".printLog();
      return (response: null, exception: null);
    }
  }

  @override
  Future<ApiResult> verifyEmail(String otp) async {
    try {
      final credential = await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: "",
        actionCodeSettings: ActionCodeSettings(url: ""),
      );

      return (response: null, exception: null);
    } on FirebaseAuthException catch (e) {
      "$runtimeType exception: $e".printLog();
      return (response: null, exception: null);
    }
  }
}
