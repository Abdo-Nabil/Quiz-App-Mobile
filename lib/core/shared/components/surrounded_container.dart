import 'package:flutter/material.dart';

import '../../../resources/app_margins_paddings.dart';
import '../../../resources/colors_manager.dart';

class SurroundedContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const SurroundedContainer({
    required this.height,
    required this.width,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        // color: ColorsManager.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppPadding.p16),
          side: const BorderSide(color: ColorsManager.whiteColor, width: 3),
        ),
      ),
      child: child,
    );
  }
}
