import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

abstract class AppTheme {
  static final ColorScheme _colorScheme = ColorScheme(

     onBackground: AppColors.white,
      background: AppColors.white,

      brightness: Brightness.light,
      primary: AppColors.blueShades[50]!,
      onPrimary: AppColors.lightBlue,
      secondary: AppColors.green,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.lightRed,
      surface: AppColors.blackShades[50]!,
      onSurface: AppColors.grey
  );





  static ThemeData lightTheme=ThemeData(
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme:  TextTheme(
      
     
        bodyLarge: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.blackShades[50]),
        bodyMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.blackShades[50]),
        bodySmall: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey),
        titleLarge: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.blackShades[50])),
      
    




  );
}