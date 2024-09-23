import 'dart:developer';
import 'package:flutter/material.dart';

extension LogExtension on Object? {
  void printLog([String? message]) {
    log(message ?? toString(), level: 1000);
  }
}

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension Validators on String {
  bool get isValidName {
    final name = RegExp(r"^[A-Za-z]+$");
    return name.hasMatch(this);
  }

  bool get isValidEmail {
    final email = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return email.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }
}
