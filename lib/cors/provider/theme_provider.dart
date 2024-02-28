import 'package:flutter/material.dart';
import 'package:wist_test_task/cors/services/state_prefs.dart';

class ThemeProvider with ChangeNotifier {
  StatePrefs themePrefs = StatePrefs("THEME_STATUS");
  bool _darkTheme = false;
  bool get getTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    themePrefs.setTheState(value);
    notifyListeners();
  }
}
