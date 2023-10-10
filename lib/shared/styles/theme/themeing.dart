import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors/colors.dart';

import '../fonts/text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme:
        const AppBarTheme(elevation: 0.0, color: AppColor.primryColorLight),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0.0,
    ),
    scaffoldBackgroundColor: AppColor.bgColorLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    textTheme:  TextTheme(
      bodyLarge: AppFontStyle.bodyLarge,
      bodyMedium: AppFontStyle.bodyMedium,
      bodySmall: AppFontStyle.bodySmall,
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
