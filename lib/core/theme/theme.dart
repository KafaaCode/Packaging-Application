import 'package:flutter/material.dart';

class AppColors {
  static const primaryGreen = Color.fromRGBO(112, 185, 190, 1);
  static const backgroundColor = Color(0xFFFFFFFF);
  static const darkBackgroundColor = Color(0xFF121212);
  static const darkPrimaryGreen = Color.fromRGBO(112, 185, 190, 1);
  static const shadowColor = Colors.grey;
  static const darkShadowColor = Colors.black;
  static const accentColor = Color.fromRGBO(223, 181, 71, 1);
  static const errorColor = Colors.red;
}

final lightTheme = ThemeData(
  primaryColor: AppColors.primaryGreen,
  fontFamily: 'Cairo', // الخط الافتراضي
  scaffoldBackgroundColor: AppColors.backgroundColor,
  cardColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.black),
  // primaryIconTheme: ,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.accentColor, // Define accentColor
  ),
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[50],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.accentColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
    ),
  ),
  textTheme: TextTheme(
    headlineMedium: const TextStyle(
      fontFamily: 'Bahij_TheSansArabic', // خط العناوين
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Cairo', // خط النصوص العادية
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.grey[800],
    ),
    bodyLarge: const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodySmall: const TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primaryGreen,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  shadowColor: AppColors.shadowColor,
  dividerColor: Colors.grey[300],
);

final darkTheme = ThemeData(
  primaryColor: AppColors.darkPrimaryGreen,
  fontFamily: 'Cairo', // الخط الافتراضي
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  cardColor: Colors.grey[900],
  iconTheme: const IconThemeData(color: Colors.white),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.accentColor, // Define accentColor
  ),
  appBarTheme: const AppBarTheme(
    elevation: 4,
    backgroundColor: AppColors.darkPrimaryGreen,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.accentColor, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Bahij_TheSansArabic', // خط العناوين
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white60,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Cairo',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.darkPrimaryGreen,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  shadowColor: AppColors.darkShadowColor,
  dividerColor: Colors.grey[700],
);
