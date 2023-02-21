import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../features/localization/presentation/cubits/localization_cubit.dart';
import '../../resources/app_margins_paddings.dart';
import '../../resources/app_strings.dart';
import '../../resources/colors_manager.dart';
import '../../resources/styles_manager.dart';
import 'add_horizontal_space.dart';

class CustomFormFiled extends StatelessWidget {
  final BuildContext context;
  final String label;
  final Widget prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController controller;
  final Function? onChange;
  final Function? validate;
  final Function? onTap;
  final Function? onFieldSubmitted;
  final TextInputType? textInputType;
  final bool showPlus20;
  final bool readOnly;
  final bool autoFocus;

  const CustomFormFiled({
    required this.context,
    required this.label,
    required this.prefixWidget,
    this.suffixWidget,
    required this.controller,
    this.onChange,
    this.validate,
    this.onTap,
    this.onFieldSubmitted,
    this.textInputType,
    this.showPlus20 = false,
    this.readOnly = false,
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final bool isEnglishLocale =
        LocalizationCubit.getIns(context).isEnglishLocale();
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      keyboardType: textInputType,
      readOnly: readOnly,
      autofocus: autoFocus,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        labelStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          color: Colors.white,
        ),
        labelText: label.tr(context),
        suffixIcon: !showPlus20
            ? suffixWidget
            : isEnglishLocale
                ? null
                : showPlus20
                    ? const ArabicSuffix()
                    : null,
        prefixIcon: !showPlus20
            ? prefixWidget
            : isEnglishLocale
                ? EnglishPrefix(
                    iconWidget: prefixWidget,
                  )
                : prefixWidget,
      ),
      onChanged: (value) {
        if (onChange != null) {
          onChange!(value);
        }
      },
      validator: (value) {
        if (validate != null) {
          return validate!(value);
        } else {
          return null;
        }
      },
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!(value);
        }
      },

      // decoration: ,
    );
  }
}

class EnglishPrefix extends StatelessWidget {
  const EnglishPrefix({
    Key? key,
    required this.iconWidget,
  }) : super(key: key);
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          iconWidget,
          const AddHorizontalSpace(AppPadding.p14),
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p16),
            child: Text(
              AppStrings.plus20English,
              style: plus20textStyle(context),
            ),
          )
        ],
      ),
    );
  }
}

class ArabicSuffix extends StatelessWidget {
  const ArabicSuffix({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Text(
            AppStrings.plus20Arabic,
            style: plus20textStyle(context),
          ),
        ),
      ],
    );
  }
}
