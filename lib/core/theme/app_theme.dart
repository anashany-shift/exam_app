import 'package:exam_app/core/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static ThemeData _getTheme({
    required ColorScheme colorScheme,
    required Color textFieldBorderColor,
    required Color elevatedBorderSideColor,
  }) {
    return ThemeData(
      colorScheme: colorScheme,

      iconTheme: IconThemeData(
        color: colorScheme.secondary
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: colorScheme.secondary,
        centerTitle: false,
        elevation: 0,
        titleSpacing: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 60,
        indicatorColor: AppColors.blue[10],
        backgroundColor: AppColors.lightBlue,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 16.sp, color: colorScheme.secondary),
        bodyMedium: TextStyle(fontSize: 14.sp, color: colorScheme.secondary),
        bodySmall: TextStyle(fontSize: 12.sp, color: colorScheme.secondary),
        titleLarge: TextStyle(
          fontSize: 20.sp,
          color: colorScheme.secondary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(fontSize: 18.sp, color: colorScheme.secondary),
        titleSmall: TextStyle(
          fontSize: 16.sp,
          color: colorScheme.secondary,
          fontWeight: FontWeight.w400,
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textFieldBorderColor, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textFieldBorderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textFieldBorderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: colorScheme.primary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            side:BorderSide.none ,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
        ),
      ),
    );
  }

  static ThemeData lightTheme = _getTheme(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.blue,
    ),
    textFieldBorderColor: AppColors.grey,
    elevatedBorderSideColor: AppColors.blue,
  );
}
