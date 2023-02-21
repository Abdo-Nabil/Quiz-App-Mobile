import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/features/authentication/presentation/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../resources/app_strings.dart';
import '../../home_screen/presentation/home_screen.dart';
import '../../on_boarding/on_boarding_screen.dart';
import 'general_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  final SharedPreferences sharedPreferences;
  GeneralCubit({required this.sharedPreferences}) : super(GeneralInitial());

  late Widget selectedScreen;

  getInitialScreen() {
    final String? result = sharedPreferences.getString(AppStrings.storedRoute);
    if (result == null) {
      selectedScreen = const OnBoardingScreen();
    }
    //
    else {
      final String? token = sharedPreferences.getString(AppStrings.storedToken);
      if (token == null) {
        selectedScreen = const LoginScreen();
      } else {
        selectedScreen = const HomeScreen();
      }
    }
  }

  Future setInitialScreen(String routeName) async {
    await sharedPreferences.setString(
      AppStrings.storedRoute,
      routeName,
    );
  }
}
