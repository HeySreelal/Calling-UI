import 'package:flutter/material.dart';

class CallTheme {
  static const Color black = Color(0xFF202126);
  static const Color white = Color(0xFFF0F1F3);
  static const Color green = Color(0xFF2AAB5B);
  static const Color red = Color(0xFFE92243);
  static const Color blue = Color(0xFFBAD8F0);
  static const Color orange = Color(0xFFB99C7C);
  static const Color greyish = Color(0xFF7D7E83);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: black,
      colorScheme: const ColorScheme.dark(
        primary: black,
        onPrimary: green,
        secondary: blue,
        onSecondary: orange,
        surface: black,
        onSurface: green,
        background: black,
        onBackground: green,
        error: red,
        onError: green,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: black,
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: greyish,
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          color: white,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
