import 'dart:convert';
import 'dart:ui';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../resources/app_strings.dart';
import '../../locale/app_localizations_setup.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  final SharedPreferences sharedPreferences;
  LocalizationCubit({
    required this.sharedPreferences,
  }) : super(LocalizationInitial());

  late Locale selectedLocale;

  static LocalizationCubit getIns(context) {
    return BlocProvider.of<LocalizationCubit>(context);
  }
  getLocale() {
    final String? jsonString =
        sharedPreferences.getString(AppStrings.storedLocale);
    if (jsonString != null) {
      String decodedJsonData = json.decode(jsonString);
      selectedLocale = Locale(decodedJsonData);
    }
    //
    else {
      _setSystemLocaleIfFound(emitState: false);
    }
  }

  Future setToSystemLocale() async {
    await sharedPreferences.remove(
      AppStrings.storedLocale,
    );
    _setSystemLocaleIfFound(emitState: true);
  }

  Future setLocale(Locale locale) async {
    await sharedPreferences.setString(
      AppStrings.storedLocale,
      json.encode(locale.languageCode),
    );

    selectedLocale = locale;
    emit(LocalizationSuccessState(locale: locale));
  }

  //The system (mobile) language
  Locale _getDeviceLocale() {
    final String result = Platform.localeName; //like en_US or ar_EG
    final String localeString = result.split('_').first;
    return Locale(localeString);
  }

  void _setSystemLocaleIfFound({required bool emitState}) {
    final Locale deviceLocal = _getDeviceLocale();
    Locale systemLocaleOrEnglish =
        AppLocalizationsSetup.localeResolutionCallback(
            deviceLocal, AppLocalizationsSetup.supportedLocales);
    //
    selectedLocale = systemLocaleOrEnglish;
    if (emitState) {
      emit(LocalizationSuccessState(locale: systemLocaleOrEnglish));
    }
  }

  bool isEnglishLocale() {
    if (selectedLocale.languageCode == 'en') {
      return true;
    }
    return false;
  }
}
