import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';

class ThemeingBottomSheet extends StatelessWidget {
  const ThemeingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Light'),
                   provider.appTheme==ThemeMode.light?
                const Icon(Icons.done):const SizedBox.shrink(),
               
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark'),
                provider.appTheme==ThemeMode.dark?
                const Icon(Icons.done):const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
