import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/app_strings.dart';

class AvailableQuizzes extends StatelessWidget {
  final int numOfQuizzes;
  const AvailableQuizzes(this.numOfQuizzes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Text(
            '${AppStrings.availableQuizzes.tr(context)} ($numOfQuizzes)',
            style: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
