import 'package:flutter/material.dart';
import 'package:todo/layout/home.dart';

import 'routes.dart';

class AppRouter {
  static Route<Widget> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
   
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
    }
  }
}
