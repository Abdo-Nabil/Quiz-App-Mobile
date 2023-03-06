import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/font_manager.dart';

class ErrorBloc extends StatelessWidget {
  const ErrorBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Sorry for that, but some thing went wrong, please report the problem.',
            style: TextStyle(
              fontSize: FontSize.s20,
              color: ColorsManager.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
