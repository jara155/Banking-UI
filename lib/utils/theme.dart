
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Themes {
  static final dark = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.grey)),
    colorScheme: const ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.white54, size: 32),
  );

  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.highContrastLight(),
    iconTheme: IconThemeData(size: 32),
  );
}