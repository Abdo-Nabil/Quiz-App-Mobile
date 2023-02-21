import 'package:flutter/material.dart';

class ScaledCircularIndicator extends StatelessWidget {
  const ScaledCircularIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: const CircularProgressIndicator(),
    );
  }
}
