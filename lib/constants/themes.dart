import 'package:animeworld/constants/colors.dart';
import 'package:flutter/material.dart';

const white = Color(0xFFFFFFF0);

class AppTheme {
  AppTheme._();
// Define the theme
  static ThemeData darkTheme = ThemeData(
    // Define the primary colors
    primaryColor: primary,

    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondary),

    scaffoldBackgroundColor: white,
    // Define the text theme
    textTheme: const TextTheme(
      headlineLarge:
          TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: white),
      headlineMedium:
          TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: white),
      headlineSmall:
          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: white),
      bodyLarge: TextStyle(fontSize: 16, color: white),
      bodyMedium: TextStyle(fontSize: 14, color: white),
      bodySmall: TextStyle(fontSize: 11, color: white),
    ),

    // Define the app bar theme
    // Define the app bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: white,
      ),
    ),

    // Define the card theme
    cardTheme: CardTheme(
      color: grey,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: white,
      unselectedItemColor: grey,
      selectedIconTheme: IconThemeData(color: white),
      unselectedIconTheme: IconThemeData(color: grey),
    ),

    // Define the button theme
    buttonTheme: ButtonThemeData(
      buttonColor: secondary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    // Define the input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: grey,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: secondary),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
