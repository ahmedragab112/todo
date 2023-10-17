import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:todo/shared/widgets/setting_box.dart';
import 'package:todo/shared/widgets/bottom_sheets/themeing_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/widgets/bottom_sheets/language_bottom_sheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          SizedBox(
            height: 20.h,
          ),
          SettingBox(
            text: provider.languageCode == 'en'
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            function: () {
              showLanguageBottomSheet(context);
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SettingBox(
            text: provider.appTheme == ThemeMode.light
                ? AppLocalizations.of(context)!.light
                : AppLocalizations.of(context)!.dark,
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
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      context: context,
      builder: (context) => const ThemeingBottomSheet(),
    );
  }

  showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}
