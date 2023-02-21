import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;
import 'app_localizations.dart';
import 'app_localizations_setup.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  //
  const AppLocalizationsDelegate();
  //
  @override
  bool isSupported(Locale locale) {
    return AppLocalizationsSetup.supportedLanguagesList
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
