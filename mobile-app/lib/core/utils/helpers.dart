import 'package:oktoast/oktoast.dart';

import '../../config/router/router.dart' show router;
import 'extensions.dart';

import '../../src/shared/in_app_alert.dart';

class UtilHelpers {
  static void pushRoute(String routeName) {
    router.pushNamed(routeName);
  }

  static void clearPreviousAndPushRoute(String routeName) {
    router.goNamed(routeName);
  }

  static void popRoute() {
    router.pop();
  }

  static String? nameValidator(String? name) {
    if (name!.isEmpty) {
      return 'Enter a name';
    } else if (!name.isValidName) {
      return 'Enter a valid name';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email!.isEmpty) {
      return 'Enter a email';
    } else if (!email.isValidEmail) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Enter a password.';
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? newPassword, String? oldPassword) {
    if (newPassword != oldPassword) {
      return 'The passwords are not the same.';
    } else if (newPassword!.isEmpty) {
      return 'required';
    }
    return null;
  }

  static void showAlert({required String title, required String message}) {
    const Duration duration = Duration(milliseconds: 1500);
    showToastWidget(
      InAppAlert(title: title, message: message, duration: duration),
      position: ToastPosition.top,
      duration: duration,
    );
  }
}
