import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

import '../../config/router/router.dart' show router;
import '../../src/shared/widgets/in_app_alert.dart';
import 'extensions.dart';

class UtilHelpers {
  UtilHelpers._();

  static void pushTo(String routeName, [Map<String, String>? pathParams]) {
    router.pushNamed(
      routeName,
      pathParameters: pathParams ?? {},
    );
  }

  static void goTo(String routeName) {
    router.goNamed(routeName);
  }

  static void pushReplacementRoute(String routeName) {
    router.pushReplacementNamed(routeName);
  }

  static void pop<T>([T? result]) {
    router.pop(result);
  }

  static String? nameValidator(String? name) {
    if (name!.isEmpty) {
      return 'Enter a name';
    } else if (!name.isValidName) {
      return 'Enter a valid name';
    }
    return null;
  }

  static String? otpValidator(String? otp) {
    if (otp == null) {
      return 'Enter OTP code';
    } else if (otp.length != 6) {
      return 'Enter a valid otp';
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

  static String? confirmPasswordValidator(String? newPassword,
      {required String oldPassword}) {
    if (newPassword != oldPassword) {
      return 'The passwords are not the same.';
    } else if (newPassword!.isEmpty) {
      return 'required';
    }
    return null;
  }

  static String dateFormatter1(DateTime date) =>
      DateFormat("d/MM/y").format(date);

  static String dateFormatter2(DateTime date) =>
      DateFormat("d MMMM y").format(date);

  static String dateFormatter3(DateTime date) =>
      DateFormat("yyyy-MM-dd").format(date);

  static String timeFormatter1(DateTime date) =>
      DateFormat("h:mm a").format(date);

  static TimeOfDay timeFormatter2(DateTime date) =>
      TimeOfDay.fromDateTime(date);

  static void showAlert({required String title, required String message}) {
    const Duration duration = Duration(milliseconds: 2500);
    showToastWidget(
      InAppAlert(title: title, message: message, duration: duration),
      position: ToastPosition.top,
      duration: duration,
    );
  }
}
