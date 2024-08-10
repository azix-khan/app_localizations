import 'package:flutter/material.dart';
import 'package:app_localization/controller/language_change_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Language { english, spanish }

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        centerTitle: true,
        actions: [
          Consumer<LanguageChangeController>(
            builder: (context, provider, child) {
              return PopupMenuButton(
                onSelected: (Language item) {
                  if (Language.english.name == item.name) {
                    provider.changeLanguage(const Locale('en'));
                  } else {
                    provider.changeLanguage(const Locale('es'));
                  }
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<Language>>[
                  const PopupMenuItem(
                    value: Language.english,
                    child: Text('English'),
                  ),
                  const PopupMenuItem(
                    value: Language.spanish,
                    child: Text('Spanish'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(AppLocalizations.of(context)!.helloWorld),
            ),
          ],
        ),
      ),
    );
  }
}
