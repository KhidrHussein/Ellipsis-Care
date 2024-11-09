import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [true] - Dark Mode enabled
/// [false] - Light Mode enabled
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void changeTheme(bool state) =>
      state ? emit(ThemeMode.dark) : emit(ThemeMode.light);
}
