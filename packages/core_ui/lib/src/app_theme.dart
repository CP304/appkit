import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2F3238),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF2F3238),
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
