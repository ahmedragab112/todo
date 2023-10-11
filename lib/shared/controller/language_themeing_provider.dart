import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode appTheme = ThemeMode.light;

  changeLanguage(String language) {
    languageCode = language;
    notifyListeners();
  }

  changeTheme(ThemeMode newTheme) {
    appTheme = newTheme;
    notifyListeners();
  }
}
