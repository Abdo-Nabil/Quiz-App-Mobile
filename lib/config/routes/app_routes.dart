import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../resources/font_manager.dart';
import '../../resources/app_strings.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //
      // case QuizScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return const QuizScreen();
      //     },
      //   );
      //
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => Scaffold(
            body: Center(
              child: Text(
                AppStrings.notFoundPage.tr(context),
                style: const TextStyle(
                  fontSize: FontSize.s24,
                ),
              ),
            ),
          )),
    );
  }
}
