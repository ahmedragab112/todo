import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/router/router.dart';
import 'package:todo/router/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/shared/controller/language_themeing_provider.dart';
import 'package:todo/shared/styles/theme/themeing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AppProvider provider = AppProvider();
  await Future.wait([
    provider.cashTheme(),
    provider.cashLanguage(),
  ]);

  runApp(
    ChangeNotifierProvider(
      create: (context) => provider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        themeMode: provider.appTheme,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        ////AHMED RAGAB 
        onGenerateRoute: AppRouter.generatRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: provider.firebaseUser!=null?Routes.homeLayout: Routes.loginPage,
        locale: Locale(provider.languageCode),
      ),
    );
  }
}
