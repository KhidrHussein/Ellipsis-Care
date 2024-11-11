import '../../core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    primaryColorLight: AppColors.white,
    primaryColorDark: AppColors.scaffoldBgColor,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
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
        borderSide: const BorderSide(color: AppColors.generalOutlineBorder),
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
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Manrope',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkThemeMode,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16.sp,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const WidgetStatePropertyAll(AppColors.black),
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
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(maxHeight: 48.h, maxWidth: 361.w),
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(color: AppColors.generalOutlineBorder, width: .5),
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 32.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 30.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 22.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
