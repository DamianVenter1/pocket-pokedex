import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.light(
    primary: Colors.teal.shade600,
    secondary: Colors.tealAccent.shade400,
    primaryContainer: Colors.teal.shade100,
    secondaryContainer: Colors.tealAccent.shade100,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.teal.shade600,
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.teal.shade600,
    foregroundColor: Colors.white,
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark(
    primary: Colors.teal.shade400,
    secondary: Colors.tealAccent.shade200,
    primaryContainer: Colors.teal.shade800,
    secondaryContainer: Colors.teal.shade700,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900,
    foregroundColor: Colors.teal.shade300,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.teal.shade400,
    foregroundColor: Colors.white,
  ),
);

extension ThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
  MaterialColor get primary => colors.primary as MaterialColor;
  TextTheme get textStyles => Theme.of(this).textTheme;
}
