import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/core/utils/utils.dart';

class Styles {
  static const sizeIcon = 24.0;
  static const border = 8.0;
  static final String fontNameDefault = 'Muli';
  static ThemeData buildTheme;
  static const Color Transparent = Color(0xa1e0e0e0);
  static Color backgroundColor;
  static Color barColor;
  static Color uiColor;
  static Color placeholderColor;
  static Color titleColor;
  static Color subtitleColor;
  static Color colorIcon;
  static Color appColor2 = Utils.parseColor('#575859');
  static Color progress;
  static Color blueOcean = Utils.parseColor('#1FA6F7');
  static Color appColor = Utils.parseColor('#00428D');
  static ThemeData themeData;

  static ThemeData themeLight() {
    backgroundColor = Colors.white;
    placeholderColor = Colors.grey[100];
    barColor = Colors.grey[500];
    uiColor = Colors.grey[200];
    titleColor = Colors.black;
    subtitleColor = Colors.black;
    colorIcon = appColor;
    progress = appColor;
    themeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: appColor,
      accentColor: Colors.grey,
      appBarTheme:
      AppBarTheme(brightness: Brightness.light,
          color: backgroundColor,
          iconTheme: IconThemeData(color: appColor)),
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'Font',
    );
    return themeData;
  }
}
