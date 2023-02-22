import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/app_strings.dart';

class GreetingText extends StatelessWidget {
  final String userName;
  const GreetingText(this.userName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Text(
        '${AppStrings.hello.tr(context)}, $userName',
        style: TextStyle(
          color: Colors.white,
          fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
        ),
      ),
    );
  }
}
