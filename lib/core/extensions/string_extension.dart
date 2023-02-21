import 'package:flutter/material.dart';

import '../../features/localization/locale/app_localizations.dart';
import '../error/exceptions.dart';
import '../../resources/app_strings.dart';

extension TranslateX on String {
  String tr(BuildContext context) {
    try {
      String result = AppLocalizations.of(context)!.translate(this);
      return result;
    } on TranslateException {
      debugPrint(AppStrings.wordTranslationNotFound);
      return AppStrings.wordTranslationNotFound;
    }
  }
}
