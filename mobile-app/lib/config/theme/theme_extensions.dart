// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color homeColor;
  final Color homeTextColor;
  final Color homeIconColor;
  final Color reminderColor;
  final Color reminderInverseColor;
  final Color drugColor;
  final Color foodColor;
  final Color drugBgColor;
  final Color foodBgColor;
  final Color contactTileColor;
  final Color contactTileBorderColor;
  final Color deleteButtonColor;
  final Color doneButtonColor;
  final Color editTextfieldColor;
  final Color emergencySheetBgColor;
  final Color dashboardScaffoldColor;
  final Color dashboardCardColor;
  final Color breakfastCardColor;
  final Color lunchCardColor;
  final Color dinnerCardColor;
  final Color snacksCardColor;
  final Color medicationCardBorderColor;
  final Color medicationIconBgColor;
  final Color medicationProgressIndicatorColor;
  final Color medicationProgressBgColor;
  final Color settingsCardColor;

  AppThemeExtension({
    required this.homeColor,
    required this.homeTextColor,
    required this.homeIconColor,
    required this.reminderColor,
    required this.reminderInverseColor,
    required this.drugColor,
    required this.foodColor,
    required this.drugBgColor,
    required this.foodBgColor,
    required this.contactTileColor,
    required this.contactTileBorderColor,
    required this.deleteButtonColor,
    required this.doneButtonColor,
    required this.editTextfieldColor,
    required this.emergencySheetBgColor,
    required this.dashboardScaffoldColor,
    required this.dashboardCardColor,
    required this.breakfastCardColor,
    required this.lunchCardColor,
    required this.dinnerCardColor,
    required this.snacksCardColor,
    required this.medicationCardBorderColor,
    required this.medicationIconBgColor,
    required this.medicationProgressIndicatorColor,
    required this.medicationProgressBgColor,
    required this.settingsCardColor,
  });

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    Color? homeColor,
    Color? homeTextColor,
    Color? microphoneIconColor,
    Color? homeIconColor,
    Color? reminderColor,
    Color? reminderInverseColor,
    Color? drugColor,
    Color? foodColor,
    Color? drugBgColor,
    Color? foodBgColor,
    Color? contactTileColor,
    Color? contactTileBorderColor,
    Color? deleteButtonColor,
    Color? doneButtonColor,
    Color? editTextfieldColor,
    Color? emergencySheetBgColor,
    Color? dashboardScaffoldColor,
    Color? dashboardCardColor,
    Color? breakfastCardColor,
    Color? lunchCardColor,
    Color? dinnerCardColor,
    Color? snacksCardColor,
    Color? medicationCardBorderColor,
    Color? medicationIconBgColor,
    Color? medicationProgressIndicatorColor,
    Color? medicationProgressBgColor,
    Color? settingsCardColor,
  }) {
    return AppThemeExtension(
      homeColor: homeColor ?? this.homeColor,
      homeTextColor: homeTextColor ?? this.homeTextColor,
      homeIconColor: homeIconColor ?? this.homeIconColor,
      reminderColor: reminderColor ?? this.reminderColor,
      reminderInverseColor: reminderInverseColor ?? this.reminderInverseColor,
      drugColor: drugColor ?? this.drugColor,
      foodColor: foodColor ?? this.foodColor,
      drugBgColor: drugBgColor ?? this.drugBgColor,
      foodBgColor: foodBgColor ?? this.foodBgColor,
      contactTileColor: contactTileColor ?? this.contactTileColor,
      contactTileBorderColor:
          contactTileBorderColor ?? this.contactTileBorderColor,
      deleteButtonColor: deleteButtonColor ?? this.deleteButtonColor,
      doneButtonColor: doneButtonColor ?? this.doneButtonColor,
      editTextfieldColor: editTextfieldColor ?? this.editTextfieldColor,
      emergencySheetBgColor:
          emergencySheetBgColor ?? this.emergencySheetBgColor,
      dashboardScaffoldColor:
          dashboardScaffoldColor ?? this.dashboardScaffoldColor,
      dashboardCardColor: dashboardCardColor ?? this.dashboardCardColor,
      breakfastCardColor: breakfastCardColor ?? this.breakfastCardColor,
      lunchCardColor: lunchCardColor ?? this.lunchCardColor,
      dinnerCardColor: dinnerCardColor ?? this.dinnerCardColor,
      snacksCardColor: snacksCardColor ?? this.snacksCardColor,
      medicationCardBorderColor:
          medicationCardBorderColor ?? this.medicationCardBorderColor,
      medicationIconBgColor:
          medicationIconBgColor ?? this.medicationIconBgColor,
      medicationProgressIndicatorColor: medicationProgressIndicatorColor ??
          this.medicationProgressIndicatorColor,
      medicationProgressBgColor:
          medicationProgressBgColor ?? this.medicationProgressBgColor,
      settingsCardColor: settingsCardColor ?? this.settingsCardColor,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
      covariant ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      homeColor: Color.lerp(homeColor, other.homeColor, t)!,
      homeTextColor: Color.lerp(homeTextColor, other.homeTextColor, t)!,
      homeIconColor: Color.lerp(homeIconColor, other.homeIconColor, t)!,
      reminderColor: Color.lerp(reminderColor, other.reminderColor, t)!,
      reminderInverseColor:
          Color.lerp(reminderInverseColor, other.reminderInverseColor, t)!,
      drugColor: Color.lerp(drugColor, other.drugColor, t)!,
      foodColor: Color.lerp(foodColor, other.foodColor, t)!,
      drugBgColor: Color.lerp(drugBgColor, other.drugBgColor, t)!,
      foodBgColor: Color.lerp(foodBgColor, other.foodBgColor, t)!,
      contactTileColor:
          Color.lerp(contactTileColor, other.contactTileColor, t)!,
      contactTileBorderColor:
          Color.lerp(contactTileBorderColor, other.contactTileBorderColor, t)!,
      deleteButtonColor:
          Color.lerp(deleteButtonColor, other.deleteButtonColor, t)!,
      doneButtonColor: Color.lerp(doneButtonColor, other.doneButtonColor, t)!,
      editTextfieldColor:
          Color.lerp(editTextfieldColor, other.editTextfieldColor, t)!,
      emergencySheetBgColor:
          Color.lerp(emergencySheetBgColor, other.emergencySheetBgColor, t)!,
      dashboardScaffoldColor:
          Color.lerp(dashboardScaffoldColor, other.dashboardScaffoldColor, t)!,
      dashboardCardColor:
          Color.lerp(dashboardCardColor, other.dashboardCardColor, t)!,
      breakfastCardColor:
          Color.lerp(breakfastCardColor, other.breakfastCardColor, t)!,
      lunchCardColor: Color.lerp(lunchCardColor, other.lunchCardColor, t)!,
      dinnerCardColor: Color.lerp(dinnerCardColor, other.dinnerCardColor, t)!,
      snacksCardColor: Color.lerp(snacksCardColor, other.snacksCardColor, t)!,
      medicationCardBorderColor: Color.lerp(
          medicationCardBorderColor, other.medicationCardBorderColor, t)!,
      medicationIconBgColor:
          Color.lerp(medicationIconBgColor, other.medicationIconBgColor, t)!,
      medicationProgressIndicatorColor: Color.lerp(
          medicationProgressIndicatorColor,
          other.medicationProgressIndicatorColor,
          t)!,
      medicationProgressBgColor: Color.lerp(
          medicationProgressBgColor, other.medicationProgressBgColor, t)!,
      settingsCardColor:
          Color.lerp(settingsCardColor, other.settingsCardColor, t)!,
    );
  }
}
