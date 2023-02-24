import 'package:flutter/material.dart';

import '../../resources/app_margins_paddings.dart';

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
        // color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppPadding.p16),
          side: const BorderSide(color: Colors.white, width: 3),
        ),
      ),
      child: child,
    );
  }
}
