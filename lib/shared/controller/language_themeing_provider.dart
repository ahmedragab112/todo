import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String languageCode = 'en';

  changeLanguage(String language) {
    languageCode = language;
    notifyListeners();
  }
}
