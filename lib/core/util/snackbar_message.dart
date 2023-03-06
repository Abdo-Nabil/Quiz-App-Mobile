import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';

class SnackBarMessage {
  void showSuccessSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: ColorsManager.whiteColor),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showErrorSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: ColorsManager.whiteColor),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
