import 'package:flutter/material.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';

class AppTextStyles {
  TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'roboto',
        color: color,
        fontWeight: fontWeight);
  }

// regular style

  TextStyle getRegularStyle(
      {double fontSize = AppFontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.regular, color);
  }

// medium style

  TextStyle getMediumStyle(
      {double fontSize = AppFontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.medium, color);
  }

// medium style

  TextStyle getLightStyle(
      {double fontSize = AppFontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.light, color);
  }

// bold style

  TextStyle getBoldStyle(
      {double fontSize = AppFontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.bold, color);
  }

// semiBold style

  TextStyle getSemiBoldStyle(
      {double fontSize = AppFontSize.s12, required Color color}) {
    return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
  }
}
