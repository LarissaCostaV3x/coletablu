import 'package:flutter/material.dart';

import 'colors.dart';

/// App theme
class AppTheme {
  AppTheme._();

  /// Default theme
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'Roboto',
      textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16, color: ColorsApp.text)),
      scaffoldBackgroundColor: ColorsApp.lightYellow,
      inputDecorationTheme: InputDecorationTheme(
        hoverColor: Colors.transparent,
        hintStyle: TextStyle(color: ColorsApp.text, fontSize: 16, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: ColorsApp.borderOlive, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: ColorsApp.borderOlive, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: ColorsApp.borderOlive, width: 2),
        ),
      ),
    );
  }
}
