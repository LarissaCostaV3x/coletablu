import 'package:flutter/material.dart';

import 'buttons.dart';
import 'colors.dart';

/// App theme
class AppTheme {
  AppTheme._();

  /// Default theme
  static ThemeData themeData() {
    return ThemeData(
      fontFamily: 'SF',
      textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16, color: ColorsApp.text)),
      scaffoldBackgroundColor: ColorsApp.lightYellow,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        hoverColor: Colors.transparent,
        hintStyle: TextStyle(color: ColorsApp.text, fontSize: 16, fontWeight: FontWeight.normal),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsApp.borderOlive, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsApp.borderOlive, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorsApp.borderOlive, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonsCustom.defaultElevatedButton),
    );
  }
}
