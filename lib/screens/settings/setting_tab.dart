// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/shared/widgets/setting_box.dart';
import 'package:todo/shared/widgets/themeing_bottom_sheet.dart';

import '../../shared/widgets/language_bottom_sheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Language',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          SettingBox(
            text: 'English',
            function: () {
              showLanguageBottomSheet(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Mode',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          SettingBox(
            text: 'Light',
            function: () {
              showThemeingBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  showThemeingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeingBottomSheet(),
    );
  }

  showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
