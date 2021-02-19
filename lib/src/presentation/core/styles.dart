import 'package:flutter/material.dart';
import 'package:flutter_package/src/utils/theme.dart';

BoxDecoration decoration(
    {Color color,
    BoxBorder border,
    double borderRadius = 0,
    DecorationImage image,
    BoxShape shape = BoxShape.rectangle}) {
  return BoxDecoration(
      image: image,
      color: color ?? CustomTheme.placeholderColor,
      shape: shape,
      border: border,
      borderRadius: (shape == BoxShape.rectangle)
          ? BorderRadius.circular(borderRadius)
          : null);
}

TextStyle styleText({
  Color color,
  double size,
  FontWeight fontWeight,
  TextDecoration decoration,
  String font,
}) {
  return TextStyle(
      fontFamily: font ?? 'Font',
      fontSize: size ?? 16,
      color: color ?? CustomTheme.titleColor,
      decoration: decoration,
      fontWeight: fontWeight ?? FontWeight.normal);
}
