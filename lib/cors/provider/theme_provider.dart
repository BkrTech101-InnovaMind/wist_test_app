import 'package:flutter/material.dart';
import 'package:wist_test_task/cors/services/theme_prefs.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefs themePrefs = ThemePrefs();
  bool _darkTheme = false;
  bool get getTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    themePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
