import 'package:flutter/material.dart';

import '../../resources/app_margins_paddings.dart';

class AppTheme {
  static ThemeData lightTheme(Locale locale, BuildContext context) {
    return ThemeData(
        // textTheme: Theme.of(context)
        //     .textTheme
        //     .apply(bodyColor: Colors.white, displayColor: Colors.white),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppPadding.p16),
          ),
        )
        // fontFamily: locale.languageCode == 'en' ? 'DynaPuff' : 'Amiri',
        // colorScheme: const ColorScheme.light().copyWith(
        //   secondary: ColorsManager.secondary,
        //   primary: ColorsManager.primary,
        //   onSurface: ColorsManager.onSurface,
        //   onSecondary: ColorsManager.onSecondary,
        //   onBackground: ColorsManager.onBackground,
        // ),
        // inputDecorationTheme: InputDecorationTheme(
        //   contentPadding: const EdgeInsets.all(AppPadding.p16),
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(AppPadding.p20),
        //   ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(AppPadding.p20),
        //   borderSide: BorderSide(color: Colors.white),
        // ),

        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        //   borderRadius: BorderRadius.circular(AppPadding.p20),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(AppPadding.p20),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.white),
        //   borderRadius: BorderRadius.circular(AppPadding.p20),
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(AppPadding.p20),
        // ),
        // ),
        );
  }

  static ThemeData darkTheme(Locale locale, BuildContext context) {
    return ThemeData(
      // fontFamily: locale.languageCode == 'en' ? 'DynaPuff' : 'Amiri',
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.blue,
        secondary: Colors.blue,
        onPrimary: Colors.white,
        onSecondary: Colors.deepOrange,

        // onSurface: Colors.white,
        // onSecondary: Colors.white,
        // onBackground: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppPadding.p20),
          ),
          textStyle: const TextStyle().copyWith(
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.all(AppPadding.p14),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppPadding.p20),
        ),
      ),
    );
  }
}
//
// ThemeData appTheme() {
//   return ThemeData(
//       primaryColor: AppColors.primary,
//       hintColor: AppColors.hint,
//       brightness: Brightness.light,
//       scaffoldBackgroundColor: Colors.white,
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
//             color: Colors.white,
//             fontWeight: FontWeight.bold),
//       ));
// }
