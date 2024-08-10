import 'package:app_localization/controller/language_change_controller.dart';
import 'package:app_localization/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  final String languageCode = sp.getString('language_code') ?? '';

  runApp(MyApp(
    locale: languageCode,
  ));
}

class MyApp extends StatelessWidget {
  final String locale;
  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageChangeController(),
        ),
      ],
      child: Consumer<LanguageChangeController>(
        builder: (context, provider, child) {
          if (provider.appLocale == null) {
            provider.changeLanguage(Locale(locale.isNotEmpty ? locale : 'en'));
          }
          return MaterialApp(
            title: 'Flutter Localizations',
            debugShowCheckedModeBanner: false,
            // locale: Locale('es'), // static
            locale: provider.appLocale ?? const Locale('en'), // from provider
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('es'), // Spanish
            ],
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
