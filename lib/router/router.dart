import 'package:flutter/material.dart';
import 'package:todo/layout/home.dart';
import 'package:todo/screens/login/login.dart';
import 'routes.dart';

class AppRouter {
  static Route<Widget> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (context) =>  LoginPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>  LoginPage(),
        );
    }
  }
}
