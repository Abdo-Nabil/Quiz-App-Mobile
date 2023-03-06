import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../resources/app_margins_paddings.dart';
import '../../resources/colors_manager.dart';

enum ToastStates { success, error, warning }

class ToastHelper {
  //
  static late FToast _flutterToast;

  static void initializeToast(BuildContext context) {
    _flutterToast = FToast();
    _flutterToast.init(context);
  }

  //
  static void showToast(
      BuildContext context, String message, ToastStates state) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppPadding.p20),
        color: chooseToastColor(state),
      ),
      child: Text(
        message,
        style: const TextStyle(
          color: ColorsManager.whiteColor,
        ),
      ),
    );
    //
    _flutterToast.removeQueuedCustomToasts();
    _flutterToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      // fadeDuration: 350,
      // gravity: ToastGravity.BOTTOM,
    );
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
  }
}

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber.shade900;
      break;
  }

  return color;
}
