import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/context_extension.dart';

import '../../../../resources/app_margins_paddings.dart';

class OptionContainer extends StatelessWidget {
  final bool isSelected;
  final String optionText;
  const OptionContainer({
    required this.isSelected,
    required this.optionText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.07,
      width: context.width * 0.83,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.orange.withOpacity(0.13) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppPadding.p16),
          side: BorderSide(
            color: isSelected ? Colors.orange.withOpacity(0.2) : Colors.grey,
            width: 1.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Text(
                optionText,
                style: TextStyle(
                  color: isSelected ? Colors.orange : Colors.black,
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(
                      color: isSelected ? Colors.orange : Colors.grey,
                      width: 1.5),
                ),
              ),
              child: CircleAvatar(
                backgroundColor:
                    isSelected ? Colors.orange.withOpacity(0.5) : Colors.white,
                radius: 10,
                child: isSelected
                    ? const CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 5,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
