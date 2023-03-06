import 'package:flutter/material.dart';

import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/colors_manager.dart';

class OptionContainerWithStates extends StatelessWidget {
  const OptionContainerWithStates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Text(
              '1) yes',
              style: TextStyle(
                color: Colors.green,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              ),
            ),
          ),
          Container(
            decoration: ShapeDecoration(
                color: Colors.green,
                // color: ColorsManager.whiteColor,
                shape: CircleBorder(
                  side: const BorderSide(color: Colors.grey, width: 2),
                )
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(AppPadding.p16),
                //   side: const BorderSide(color: Colors.grey, width: 3),
                // ),
                ),
            //optionStatus.name==OptionStatus.notSelected
            child: Icon(
              Icons.check_sharp,
              size: 20,
              color: ColorsManager.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
