import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';

import '../../config/router/router.dart' show router;
import '../../src/features/reminders/presentation/views/add_reminder.dart';
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

  static void killKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
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

  static String? confirmPasswordValidator(String? newPassword,
      {required String oldPassword}) {
    if (newPassword != oldPassword) {
      return 'The passwords are not the same.';
    } else if (newPassword!.isEmpty) {
      return 'required';
    }
    return null;
  }

  static String dateFormatter1(DateTime date) {
    return DateFormat("d/MM/y").format(date);
  }

  static String dateFormatter2(DateTime date) =>
      DateFormat("d MMMM y").format(date);

  static String dateFormatter3(DateTime date) =>
      DateFormat("yyyy-MM-dd").format(date);

  static String getDateFromIsoString(String isoString) {
    return isoString.split("T")[0];
  }

  static String getTimeFromIsoString(String isoString) {
    final dateTime = DateTime.parse(isoString);
    return DateFormat.jm().format(dateTime).replaceAll(' ', '');
  }

  static String getHourMinutes(String isoString) {
    final dateTime = DateTime.parse(isoString);
    final formattedTime = DateFormat.jm().format(dateTime); // e.g., "2:51 PM"
    return formattedTime
        .replaceAll(':', '-')
        .replaceAll(' ', '_'); // e.g., "2-51_PM"
  }

  static void showAlert({required String title, required String message}) {
    const Duration duration = Duration(milliseconds: 2500);
    showToastWidget(
      InAppAlert(title: title, message: message, duration: duration),
      position: ToastPosition.top,
      duration: duration,
    );
  }

  static void showReminderDialog({required BuildContext context}) async {
    await showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const AddReminder(),
    );
  }
}
