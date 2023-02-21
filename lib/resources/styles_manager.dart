import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/localization/presentation/cubits/localization_cubit.dart';
import 'colors_manager.dart';
import 'font_manager.dart';

TextStyle appNameTextStyle(BuildContext context) {
  return TextStyle(
    fontSize: FontSize.s44,
    color: ColorsManager.whiteColor,
    // fontWeight: fontWeight,
    fontFamily: BlocProvider.of<LocalizationCubit>(context)
                .selectedLocale
                .languageCode ==
            'en'
        ? 'DynaPuff'
        : 'Amiri',
  );
}

TextStyle? plus20textStyle(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .subtitle1
      ?.copyWith(color: ColorsManager.whiteColor);
}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// bold style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}
