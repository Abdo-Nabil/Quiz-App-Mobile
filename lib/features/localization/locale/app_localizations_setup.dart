import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';

class AppLocalizationsSetup {
  //
  static const Iterable<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];
  static const List<String> supportedLanguagesList = [
    'en',
    'ar',
  ];
  //

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];

  static Locale localeResolutionCallback(
      Locale? deviceLocal, Iterable<Locale>? supportedLocales) {
    //
    for (Locale supportedLocale in supportedLocales!) {
      if (supportedLocale.languageCode == deviceLocal!.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
