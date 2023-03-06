import 'package:flutter/material.dart';

class AddVerticalSpace extends StatelessWidget {
  final double height;
  const AddVerticalSpace(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
