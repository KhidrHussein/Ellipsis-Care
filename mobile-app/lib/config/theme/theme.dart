import 'package:ellipsis_care/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Manrope',
    colorSchemeSeed: AppColors.primary,
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
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(maxWidth: 361.w),
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(color: AppColors.textfieldBorder, width: .5),
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 32.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 30.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 22.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: const TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Manrope',
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
            const BorderSide(color: AppColors.textfieldBorder, width: .5),
        borderRadius: BorderRadius.circular(5.r),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 36.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 32.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 30.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 24.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 22.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: const TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
