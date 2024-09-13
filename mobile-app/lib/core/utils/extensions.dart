import 'dart:developer';
import 'package:flutter/material.dart';

extension PrintExtension on Object? {
  printLog([String? message]) {
    log(message ?? toString(), level: 1000);
  }
}

extension BuildContextExtensions on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
