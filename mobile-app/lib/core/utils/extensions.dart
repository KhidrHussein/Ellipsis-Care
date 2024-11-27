import 'dart:developer';

import '../../config/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension LogExtension on Object? {
  void printLog([String? message]) {
    log(message ?? toString(), level: 1000);
  }
}

extension BuildContextExtensions on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppThemeExtension get themeExtension =>
      Theme.of(this).extension<AppThemeExtension>()!;

  ButtonStyle? get filledButtonTheme => Theme.of(this).filledButtonTheme.style;
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

extension SizedBoxExtensions on num {
  Widget get sizedBoxHeight => SizedBox(height: h);

  Widget get sizedBoxWidth => SizedBox(width: w);

  EdgeInsetsGeometry get verticalPadding => EdgeInsets.symmetric(vertical: h);

  EdgeInsetsGeometry get horizontalPadding =>
      EdgeInsets.symmetric(horizontal: w);

  EdgeInsetsGeometry get symmetricPadding =>
      EdgeInsets.symmetric(vertical: h, horizontal: w);
}

extension AlignWidgetExtensions on Widget {
  Widget get alignLeft => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );

  Widget get alignRight => Align(
        alignment: Alignment.centerRight,
        child: this,
      );

  Widget get alignCenter => Align(
        alignment: Alignment.center,
        child: this,
      );
}

extension ListPaddingExtension on List<num> {
  EdgeInsets get symmetricPadding =>
      EdgeInsets.symmetric(vertical: last.h, horizontal: first.w);
}
