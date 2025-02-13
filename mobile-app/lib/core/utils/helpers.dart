import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:toastification/toastification.dart';

import '../../config/router/router.dart' show router;
import '../../src/features/reminders/presentation/views/add_reminder.dart';
import 'extensions.dart';

class UtilHelpers {
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

  static void showError(String message) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text("Error"),
      description: Text(message),
      alignment: Alignment.topLeft,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  static void showSuccess(String message) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text("Successful"),
      description: Text(message),
      showProgressBar: false,
      alignment: Alignment.topLeft,
      autoCloseDuration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  static void showReminderDialog({required BuildContext context}) async {
    await showAdaptiveDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const AddReminder(),
    );
  }

  static Talker logger = TalkerFlutter.init(
    settings: TalkerSettings(
      colors: {
        TalkerLogType.route.key: AnsiPen()..cyan(),
        TalkerLogType.error.key: AnsiPen()..magenta(),
        TalkerLogType.debug.key: AnsiPen()..white(),
        TalkerLogType.info.key: AnsiPen()
          ..rgb(r: 100 / 255, g: 181 / 255, b: 246 / 255),
        TalkerLogType.blocCreate.key: AnsiPen()
          ..rgb(r: 129 / 255, g: 212 / 255, b: 250 / 255),
        TalkerLogType.blocEvent.key: AnsiPen()
          ..rgb(r: 255 / 255, g: 214 / 255, b: 165 / 255),
        TalkerLogType.blocTransition.key: AnsiPen()
          ..rgb(r: 171 / 255, g: 235 / 255, b: 198 / 255),
        TalkerLogType.blocClose.key: AnsiPen()
          ..rgb(r: 255 / 255, g: 171 / 255, b: 145 / 255),
        TalkerLogType.httpRequest.key: AnsiPen()
          ..rgb(r: 255 / 255, g: 235 / 255, b: 59 / 255),
        TalkerLogType.httpResponse.key: AnsiPen()
          ..rgb(r: 0 / 255, g: 188 / 255, b: 212 / 255),
        TalkerLogType.httpError.key: AnsiPen()
          ..rgb(r: 239 / 255, g: 83 / 255, b: 80 / 255)
      },
    ),
  );
}
