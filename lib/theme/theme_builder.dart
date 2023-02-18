import '../gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import '../resources/resources.dart';

class AppTheme {
  static AppTheme? _instance;

  AppTheme._();

  factory AppTheme() {
    _instance ??= AppTheme._();
    return _instance!;
  }

  ThemeType _themeType = ThemeType.light;

  ThemeType get currentTheme => _themeType;

  ThemeData get lightTheme => _lightTheme;

  ThemeData getTheme() {
    switch (_themeType) {
      case ThemeType.light:
        return _lightTheme;
      case ThemeType.dark:
        return _lightTheme;
    }
  }

  final ThemeData _lightTheme = ThemeData(
    fontFamily: FontFamily.montserrat,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.darkCharcoal,
      ),
      color: AppColors.primaryWhite,
      iconTheme: IconThemeData(color: AppColors.darkCharcoal),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryWhite,
      background: AppColors.primaryWhite,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
          fontSize: 36,
          color: AppColors.darkCharcoal,
          letterSpacing: 0.75,
          height: 1.25,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.darkCharcoal,
        letterSpacing: 0.75,
        height: 1.25,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.onyx,
        letterSpacing: 0.75,
        height: 1.25,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        letterSpacing: 0.75,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryRed,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.primaryWhite,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.darkCharcoal,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.darkCharcoal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.onyx,
        fontFamily: FontFamily.lato,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.onyx,
      ),
      labelLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.onyx,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.onyx,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 1.25,
        letterSpacing: 0.75,
        color: AppColors.onyx,
      ),
    ),
  );
}

enum ThemeType {
  light,
  dark,
}
