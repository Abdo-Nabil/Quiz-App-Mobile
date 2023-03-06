import 'package:flutter/material.dart';

import '../../resources/app_margins_paddings.dart';
import '../../../../resources/colors_manager.dart';

class AppTheme {
  static ThemeData lightTheme(Locale locale, BuildContext context) {
    return ThemeData(
      // textTheme: Theme.of(context)
      //     .textTheme
      //     .apply(bodyColor: ColorsManager.whiteColor, displayColor: ColorsManager.whiteColor),
      iconTheme: const IconThemeData(
        color: ColorsManager.whiteColor,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppPadding.p16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppPadding.p16),
            ),
          ),
          padding:
              MaterialStateProperty.all(const EdgeInsets.all(AppPadding.p8)),
        ),
      ),
    );
  }

  static ThemeData darkTheme(Locale locale, BuildContext context) {
    return ThemeData();
  }
}
//
// ThemeData appTheme() {
//   return ThemeData(
//       primaryColor: AppColors.primary,
//       hintColor: AppColors.hint,
//       brightness: Brightness.light,
//       scaffoldBackgroundColor: ColorsManager.whiteColor,
//       fontFamily: AppStrings.fontFamily,
//       appBarTheme: const AppBarTheme(
//           centerTitle: true,
//           color: Colors.transparent,
//           elevation: 0,
//           titleTextStyle: TextStyle(
//               fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20)),
//       textTheme: const TextTheme(
//         bodyMedium: TextStyle(
//             height: 1.3,
//             fontSize: 22,
//             color: ColorsManager.whiteColor,
//             fontWeight: FontWeight.bold),
//       ));
// }
