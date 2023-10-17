import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors/colors.dart';

import '../fonts/text_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme:const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.grey,
        onPrimary: AppColor.primryColorLight,
        secondary: Colors.black,
        onSecondary: Colors.white,
        error: Colors.white,
        onError: Colors.black,
        background: AppColor.bgColorLight,
        onBackground: AppColor.primryColorLight,
        surface: Colors.white,
        onSurface: Colors.black),
    appBarTheme:
      const   AppBarTheme(elevation: 0.0, centerTitle: true, 
      iconTheme: IconThemeData(
      color: AppColor.primryColorLight
      )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0.0,
      
    ),
    scaffoldBackgroundColor: AppColor.bgColorLight,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColor.primryColorLight,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      bodyLarge: AppFontStyle.bodyLarge,
      bodyMedium: AppFontStyle.bodyMedium,
      bodySmall: AppFontStyle.bodySmall,
    ),
  );
  static ThemeData darkTheme = ThemeData(
     colorScheme:const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Colors.white,
        secondary: Colors.white,
        onSecondary: AppColor.darkColor,
        error: AppColor.darkColor,
        onError: Colors.white,
        background: AppColor.darkBg,
        onBackground: AppColor.darkColor,
        surface: Colors.black,
        onSurface: Colors.white),
    appBarTheme:
        const AppBarTheme(elevation: 0.0, centerTitle: true),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0.0,
    ),
    scaffoldBackgroundColor: AppColor.darkBg,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
        selectedItemColor: AppColor.primryColorLight,
    ),
    textTheme: TextTheme(
      bodyLarge: AppFontStyle.bodyLarge,
      bodyMedium: AppFontStyle.bodyMedium,
      bodySmall: AppFontStyle.bodySmall,
    ),
  );
}
