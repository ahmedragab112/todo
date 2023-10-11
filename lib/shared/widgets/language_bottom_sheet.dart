import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

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
              provider.changeLanguage('en');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(AppLocalizations.of(context)!.english,),
                provider.languageCode == 'en'
                    ? const Icon(Icons.done)
                    : const SizedBox.shrink()
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(AppLocalizations.of(context)!.arabic,),
                provider.languageCode == 'ar'
                    ? const Icon(Icons.done)
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
