import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/features/home_screen/cubits/home_screen_cubit.dart';

import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/app_strings.dart';

class GreetingText extends StatelessWidget {
  final String userName;
  const GreetingText(this.userName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppPadding.p16,
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${AppStrings.hello.tr(context)}, $userName',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                ),
              ),
            ],
          ),
          Positioned(
            top: -10,
            right: 0,
            child: IconButton(
              tooltip: AppStrings.signOut.tr(context),
              onPressed: () async {
                await HomeScreenCubit.getIns(context).signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
