import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        dividerColor: Colors.grey.shade400,
        brightness: Brightness.light,
      );
}
