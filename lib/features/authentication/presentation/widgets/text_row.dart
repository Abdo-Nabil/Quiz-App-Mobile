import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../../../core/widgets/add_horizontal_space.dart';
import '../../../../resources/app_margins_paddings.dart';
import '../../../../resources/colors_manager.dart';
import '../../cubits/auth_cubit.dart';

class TextRow extends StatelessWidget {
  final String text;
  final String textButton;
  final Function onTap;
  const TextRow(
      {required this.text,
      required this.textButton,
      required this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text.tr(context),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const AddHorizontalSpace(AppPadding.p8),
        TextButton(
          child: Text(
            textButton.tr(context),
          ),
          onPressed: () {
            onTap();
          },
        ),
      ],
    );
  }
}
