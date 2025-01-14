import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFE60023); // Pinterest Red
  static const Color accentColor = Color(0xFF000000); // Black
  static const Color backgroundColor = Color(0xFFFFFFFF); // White
  static const Color textColor = Color(0xFF333333); // Dark Grey
  static const Color lightGrey = Color(0xFFF5F5F5);
}

class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle subheadline = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16.0,
    color: AppColors.textColor,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14.0,
    color: AppColors.textColor,
  );
}

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.accentColor,
    textTheme: TextTheme(
      displayLarge: AppTextStyles.headline,
      displayMedium: AppTextStyles.subheadline,
      bodyLarge: AppTextStyles.body,
      bodySmall: AppTextStyles.caption,
    ),
    colorScheme: ColorScheme(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
      surface: AppColors.backgroundColor,
      background: AppColors.backgroundColor,
      error: Colors.red,
      onPrimary: AppColors.backgroundColor,
      onSecondary: AppColors.backgroundColor,
      onSurface: AppColors.textColor,
      onBackground: AppColors.textColor,
      onError: AppColors.backgroundColor,
      brightness: Brightness.light,
    ),
  );
}
