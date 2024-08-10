// OLD METHOD

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LanguageChangeController with ChangeNotifier {
//   Locale? _appLocale;
//   Locale? get appLocale => _appLocale;

//   void changeLanguage(Locale langType) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     _appLocale = langType;
//     if (langType == const Locale('en')) {
//       await sharedPreferences.setString('language_code', 'en');
//     } else {
//       await sharedPreferences.setString('language_code', 'es');
//     }
//     notifyListeners();
//   }
// }

// NEW METHOD

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController extends ChangeNotifier {
  Locale? _appLocale;

  Locale? get appLocale => _appLocale;

  void changeLanguage(Locale locale) async {
    if (_appLocale == locale) return;
    _appLocale = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    notifyListeners();
  }
}
