import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/resources/colors_manager.dart';

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
    return TextFormField(
      style: const TextStyle(
        color: ColorsManager.whiteColor,
      ),
      controller: controller,
      keyboardType: textInputType,
      readOnly: readOnly,
      autofocus: autoFocus,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.whiteColor),
        ),
        prefixIconColor: ColorsManager.whiteColor,
        suffixIconColor: ColorsManager.whiteColor,
        labelStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
          color: ColorsManager.whiteColor,
        ),
        labelText: label.tr(context),
        prefixIcon: prefixWidget,
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
