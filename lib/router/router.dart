import 'package:flutter/material.dart';
import 'package:todo/layout/home.dart';
import 'package:todo/screens/taskes/home_tasks.dart';

import 'routes.dart';

class AppRouter {
  static Route<dynamic> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.testPage:
        return MaterialPageRoute(
          builder: (_) => const Test(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
