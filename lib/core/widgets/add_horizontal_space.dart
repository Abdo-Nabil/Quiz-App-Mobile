import 'package:flutter/material.dart';

class AddHorizontalSpace extends StatelessWidget {
  final double width;
  const AddHorizontalSpace(this.width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
