import 'package:flutter/material.dart';

import '../router/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,Routes.testPage );
            },
            child: Text('first Screen')),
      ),
    );
  }
}
