import 'package:flutter/material.dart';
import 'package:news_app_api/services/dark_theme_preferences.dart';

class ThemeProvider with ChangeNotifier {
  DarkThemePreferences darkThemePrefs = DarkThemePreferences();
  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkThemePrefs(value);
    notifyListeners();
  }
}