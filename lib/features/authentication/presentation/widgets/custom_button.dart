import 'package:flutter/material.dart';

import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/colors_manager.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double padding;
  final bool isExtended;
  final Color? buttonColor;

  const CustomButton({
    required this.text,
    required this.onTap,
    this.padding = AppPadding.p8,
    this.isExtended = false,
    this.buttonColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isExtended ? double.infinity : null,
      child: ElevatedButton(
        style: buttonColor != null
            ? ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(buttonColor!),
              )
            : null,
        onPressed: () {
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.all(padding),
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
