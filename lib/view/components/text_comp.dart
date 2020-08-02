import 'package:flutter/material.dart';
import 'package:flutter_package/core/utils/Translations.dart';
import 'package:flutter_package/view/styles.dart';

class TextComp extends StatelessWidget {
  Color color;
  BuildContext context;
  double size;
  FontWeight fontWeight;
  String font;
  bool reference;
  int maxLine;
  TextAlign align;
  TextOverflow over;
  String value;

  TextComp(
      {this.color,
      this.context,
      this.size,
      this.fontWeight,
      this.font = 'Font',
      this.reference = false,
      this.maxLine = 0,
      this.align,
      this.over,
      this.value});

  @override
  Widget build(BuildContext context) {
    return _text();
  }

  textStyle({
    Color color,
    double size,
    FontWeight fontWeight,
    String font = 'Font',
  }) {
    return TextStyle(
        fontFamily: font,
        fontSize: size ?? 16,
        color: color ?? Styles.titleColor,
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  _text() {
    return Text(
      reference ? Translations.current.text(value) : value,
      maxLines: maxLine == 0 ? null : maxLine,
      overflow: over,
      textAlign: align,
      style: textStyle(
        color: color,
        fontWeight: fontWeight,
        size: size,
        font: font,
      ),
    );
  }
}
