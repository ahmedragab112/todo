import 'package:flutter/material.dart';
import 'package:todo/layout/home.dart';
import 'package:todo/screens/edittasks/edit_task.dart';

import 'routes.dart';

class AppRouter {
  static Route<Widget> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
      case Routes.editTaskPage:
        return MaterialPageRoute(
          builder: (_) => const EditTaskPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
    }
  }
}
