import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String language) {
    languageCode = language;
    notifyListeners();
  }
  
  void changeTheme(ThemeMode newTheme) {
    appTheme = newTheme;
    notifyListeners();
  }
}
