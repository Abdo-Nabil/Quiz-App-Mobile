import 'package:flutter/material.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../resources/colors_manager.dart';

class PasswordFormFiled extends StatefulWidget {
  final BuildContext context;
  final String label;
  final TextEditingController controller;
  final Function? onChange;
  final Function? validate;
  final Function? onTap;
  final Function? onFieldSubmitted;
  final bool isNumberKeyboard;
  final bool autoFocus;
  final bool readOnly;

  const PasswordFormFiled({
    required this.context,
    required this.label,
    required this.controller,
    this.onChange,
    this.validate,
    this.onTap,
    this.onFieldSubmitted,
    this.isNumberKeyboard = false,
    this.autoFocus = false,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordFormFiled> createState() => _PasswordFormFiledState();
}

class _PasswordFormFiledState extends State<PasswordFormFiled> {
  bool isSecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.isNumberKeyboard ? TextInputType.phone : null,
      readOnly: widget.readOnly,
      autofocus: widget.autoFocus,
      style: const TextStyle(color: ColorsManager.whiteColor),
      obscureText: isSecureText,
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
        labelText: widget.label.tr(context),
        prefixIcon: const Icon(Icons.key),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isSecureText = !isSecureText;
            });
          },
          child: isSecureText
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
      onChanged: (value) {
        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      validator: (value) {
        if (widget.validate != null) {
          return widget.validate!(value);
        } else {
          return null;
        }
      },
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      onFieldSubmitted: (value) {
        if (widget.onFieldSubmitted != null) {
          widget.onFieldSubmitted!(value);
        }
      },

      // decoration: ,
    );
  }
}
