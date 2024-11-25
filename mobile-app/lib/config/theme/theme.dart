import 'package:ellipsis_care/config/theme/theme_extensions.dart';

import '../../core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
    switchTheme: const SwitchThemeData(
      splashRadius: 16,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      thumbColor: WidgetStatePropertyAll(AppColors.black),
      trackColor: WidgetStatePropertyAll(AppColors.white),
      trackOutlineColor:
          WidgetStatePropertyAll(AppColors.switchTrackOutlineColor),
    ),
    radioTheme: RadioThemeData(
      splashRadius: 16,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: const WidgetStatePropertyAll(AppColors.black),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    checkboxTheme: CheckboxThemeData(
      splashRadius: 16,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.black;
          }
          return AppColors.white;
        },
      ),
      checkColor: const WidgetStatePropertyAll(AppColors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16.sp,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          return states.contains(WidgetState.disabled)
              ? AppColors.disabledButton
              : AppColors.black;
        }),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24.w)),
        fixedSize: WidgetStatePropertyAll(Size(362.w, 56.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 15.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(361.w, 48.h)),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24.w)),
        side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.outlinedButtonBorder)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.black.withOpacity(.3),
      ),
      constraints: BoxConstraints(maxWidth: 362.w),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(5.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(5.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.circular(5.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 57.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 22.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    extensions: [
      AppThemeExtension(
          homeColor: AppColors.homeColorLight,
          homeTextColor: AppColors.homeTextColorLight,
          homeIconColor: AppColors.homeIconColorDark,
          reminderColor: AppColors.reminderColorLight,
          reminderInverseColor: AppColors.reminderColorDark,
          drugColor: AppColors.drugColorLight,
          foodColor: AppColors.foodColorLight,
          drugBgColor: AppColors.drugBgColorLight,
          foodBgColor: AppColors.foodBgColorLight,
          contactTileColor: AppColors.contactTileColorLight,
          contactTileBorderColor: AppColors.contactTileBorderColorLight,
          deleteButtonColor: AppColors.deleteButtonColorLight,
          doneButtonColor: AppColors.doneButtonColorLight,
          editTextfieldColor: AppColors.editTextFieldColorLight,
          emergencySheetBgColor: AppColors.emergencySheetBgColorLight,
          dashboardScaffoldColor: AppColors.dashboardScaffoldColorLight,
          dashboardCardColor: AppColors.dashboardCardColorLight,
          breakfastCardColor: AppColors.breakfastCardColorLight,
          lunchCardColor: AppColors.lunchCardColorLight,
          dinnerCardColor: AppColors.dinnerCardColorLight,
          snacksCardColor: AppColors.snacksCardColorLight,
          medicationCardBorderColor: AppColors.medicationCardBorderColorLight,
          medicationIconBgColor: AppColors.medicationIconBgColorLight,
          medicationProgressIndicatorColor:
              AppColors.medicationProgressIndicatorColorLight,
          medicationProgressBgColor: AppColors.medicationProgressBgColorLight,
          settingsCardColor: AppColors.settingsCardColorLight)
    ],
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(primary: AppColors.black),
    switchTheme: const SwitchThemeData(
      splashRadius: 16,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      thumbColor: WidgetStatePropertyAll(AppColors.white),
      trackColor: WidgetStatePropertyAll(AppColors.black),
      trackOutlineColor:
          WidgetStatePropertyAll(AppColors.switchTrackOutlineColor),
    ),
    radioTheme: RadioThemeData(
      splashRadius: 16,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: const WidgetStatePropertyAll(AppColors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    checkboxTheme: CheckboxThemeData(
      splashRadius: 16,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return AppColors.darkThemeMode;
        },
      ),
      checkColor: const WidgetStatePropertyAll(AppColors.black),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16.sp,
            color: AppColors.darkThemeMode,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.white),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24.w)),
        fixedSize: WidgetStatePropertyAll(Size(362.w, 56.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 15.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(Size(361.w, 48.h)),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 24.w)),
        side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.outlinedButtonBorder)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        ),
      ),
    ),
    timePickerTheme: TimePickerThemeData(),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.black,
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white.withOpacity(.3),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(maxWidth: 361.w),
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(color: AppColors.textFieldBorderColor, width: .5),
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 57.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 22.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    extensions: {
      AppThemeExtension(
        homeColor: AppColors.homeColorDark,
        homeTextColor: AppColors.homeTextColorDark,
        homeIconColor: AppColors.homeIconColorLight,
        reminderColor: AppColors.reminderColorDark,
        reminderInverseColor: AppColors.reminderColorLight,
        drugColor: AppColors.drugColorDark,
        foodColor: AppColors.foodColorDark,
        drugBgColor: AppColors.drugBgColorDark,
        foodBgColor: AppColors.foodBgColorDark,
        contactTileColor: AppColors.contactTileColorDark,
        contactTileBorderColor: AppColors.contactTileBorderColorDark,
        deleteButtonColor: AppColors.deleteButtonColorDark,
        doneButtonColor: AppColors.doneButtonColorDark,
        editTextfieldColor: AppColors.editTextFieldColorDark,
        emergencySheetBgColor: AppColors.emergencySheetBgColorDark,
        dashboardScaffoldColor: AppColors.dashboardScaffoldColorDark,
        dashboardCardColor: AppColors.dashboardCardColorDark,
        breakfastCardColor: AppColors.breakfastCardColorDark,
        lunchCardColor: AppColors.lunchCardColorDark,
        dinnerCardColor: AppColors.dinnerCardColorDark,
        snacksCardColor: AppColors.snacksCardColorDark,
        medicationCardBorderColor: AppColors.medicationCardBorderColorDark,
        medicationIconBgColor: AppColors.medicationIconBgColorDark,
        medicationProgressIndicatorColor:
            AppColors.medicationProgressIndicatorColorDark,
        medicationProgressBgColor: AppColors.medicationProgressBgColorDark,
        settingsCardColor: AppColors.settingsCardColorDark,
      )
    },
  );
}
