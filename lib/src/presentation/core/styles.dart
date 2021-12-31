import 'package:flutter/material.dart';
import 'package:flutter_package/src/utils/theme.dart';

/// custom decoration
BoxDecoration decoration(
    {Color? color,
    BoxBorder? border,
    double borderRadius = 0,
    DecorationImage? image,
    BoxShape shape = BoxShape.rectangle}) {

  return BoxDecoration(
      image: image,
      color: (color == null) ? CustomTheme.placeholderColor : color,
      shape: shape,
      border: border,
      borderRadius: (shape == BoxShape.rectangle)
          ? BorderRadius.circular(borderRadius)
          : null);
}

/// custom text style
TextStyle styleText({
  Color? color,
  double size = 16.0,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration? decoration,
  String font = 'Font',
}) {
  return TextStyle(
      fontFamily: font,
      fontSize: size,
      color: color ?? CustomTheme.titleColor,
      decoration: decoration,
      fontWeight: fontWeight);
}
