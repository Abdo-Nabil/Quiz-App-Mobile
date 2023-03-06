import 'package:flutter/material.dart';

import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/colors_manager.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double padding;

  const CustomButton(
      {required this.text,
      required this.onTap,
      this.padding = AppPadding.p16,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.whiteColor,
                ),
          ),
        ),
      ),
    );
  }
}
