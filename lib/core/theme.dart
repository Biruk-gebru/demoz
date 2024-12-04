// lib/core/theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF4A90E2),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
      bodySmall: TextStyle(color: Colors.grey, fontSize: 12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Color(0xFF4A90E2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),
  );
}
