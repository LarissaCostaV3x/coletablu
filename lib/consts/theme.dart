import 'package:flutter/material.dart';

import 'colors.dart';

/// App theme
class AppTheme {
  AppTheme._();

  /// Default theme
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16, color: ColorsApp.black)),
    );
  }
}
