import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../../../resources/colors_manager.dart';

class LoginOrRegisterText extends StatelessWidget {
  final String text;
  const LoginOrRegisterText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr(context),
      style: TextStyle(
        fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
        color: Colors.white,
      ),
    );
  }
}
