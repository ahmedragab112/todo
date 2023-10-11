import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:todo/shared/widgets/setting_box.dart';
import 'package:todo/shared/widgets/themeing_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../shared/widgets/language_bottom_sheet.dart';

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
          const SizedBox(
            height: 20,
          ),
          SettingBox(
            text: provider.languageCode == 'en'
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            function: () {
              showLanguageBottomSheet(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(
            height: 20,
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
      context: context,
      builder: (context) => const ThemeingBottomSheet(),
    );
  }

  showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}
