import 'package:flutter/material.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/utils/util.dart';

class CustomTheme {
  static Color backgroundColor;
  static Color placeholderColor;
  static Color titleColor;
  static Color subtitleColor;
  static Color colorIcon;
  static Color progress;

  static Color get primary => Util.parseColor('#00428D');
  static ThemeData _themeData;

  static Brightness get brightness => _themeData.brightness;

  static ThemeData themeBuild() {
    backgroundColor = Colors.white;
    placeholderColor = Colors.grey[200];
    colorIcon = Util.parseColor('#00428D');
    titleColor = Colors.black;
    subtitleColor = Colors.black45;
    _themeData = ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        headline1: styleText(),
        headline2: styleText(),
        headline3: styleText(),
        headline4: styleText(),
        headline5: styleText(),
        headline6: styleText(),
        bodyText1: styleText(),
        bodyText2: styleText(),
        subtitle1: styleText(),
        subtitle2: styleText(),
        caption: styleText(),
      ).apply(bodyColor: titleColor, displayColor: titleColor),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.transparent),
      accentColor: primary,
      primaryColor: primary,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      dialogBackgroundColor: backgroundColor,
      fontFamily: 'Font',
      iconTheme: IconThemeData(color: primary),
      appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: backgroundColor,
          iconTheme: IconThemeData(color: primary)),
    );
    return _themeData;
  }
}
