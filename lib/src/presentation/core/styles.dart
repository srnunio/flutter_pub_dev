import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/constants.dart';

Widget get empty => SizedBox();

/// custom decoration
BoxDecoration decoration(
    {Color? color,
      BoxBorder? border,
      double borderRadius = 0,
      DecorationImage? image,
      BoxShape shape = BoxShape.rectangle}) {
  return BoxDecoration(
      image: image,
      color: (color == null) ? kPlaceholderColor : color,
      shape: shape,
      border: border,
      borderRadius: (shape == BoxShape.rectangle)
          ? BorderRadius.circular(borderRadius)
          : null);
}

/// custom text style
TextStyle styleText({
  Color? color,
  double fontSize = 16.0,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration? decoration,
  String? font,
}) {
  return TextStyle(
      fontFamily: font ?? fontName,
      fontSize: fontSize,
      color: color ?? kTitleTextColor,
      decoration: decoration,
      fontWeight: fontWeight);
}

ThemeData lightTheme() {
  kPrimaryColor = Color(0xFF00428D);
  kBackgroundColor = Colors.white;
  kPlaceholderColor = Colors.grey[200]!;
  kIconColor = Color(0xFF00428D);
  kTitleTextColor = Colors.black;
  kSubtitleTextColor = Colors.black;
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: styleText(),
      displayMedium: styleText(),
      displaySmall: styleText(),
      headlineMedium: styleText(),
      headlineSmall: styleText(),
      titleLarge: styleText(),
      bodyLarge: styleText(),
      bodyMedium: styleText(),
      titleMedium: styleText(),
      titleSmall: styleText(),
      bodySmall: styleText(),
    ).apply(bodyColor: kTitleTextColor, displayColor: kTitleTextColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: kBackgroundColor),
    colorScheme: ColorScheme.dark(
      background: kBackgroundColor,
      secondary: kBackgroundColor,
      brightness: Brightness.light,
    ),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    dialogBackgroundColor: kBackgroundColor,
    fontFamily: fontName,
    iconTheme: IconThemeData(color: kIconColor),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        color: kBackgroundColor,
        iconTheme: IconThemeData(color: kIconColor)),
  );
}

ThemeData darkTheme() {
  kPrimaryColor = Color(0xFF40C5FF);
  kBackgroundColor = Color(0xFF181C22);
  kPlaceholderColor = Color(0xFF2B3037);
  kIconColor = Color(0xFF40C5FF);
  kTitleTextColor = Colors.white;
  kSubtitleTextColor = Colors.white;
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: styleText(),
      displayMedium: styleText(),
      displaySmall: styleText(),
      headlineMedium: styleText(),
      headlineSmall: styleText(),
      titleLarge: styleText(),
      bodyLarge: styleText(),
      bodyMedium: styleText(),
      titleMedium: styleText(),
      titleSmall: styleText(),
      bodySmall: styleText(),
    ).apply(bodyColor: kTitleTextColor, displayColor: kTitleTextColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: kBackgroundColor),
    colorScheme: ColorScheme.light(
      secondary: kBackgroundColor,
      background: kBackgroundColor,
      brightness: Brightness.dark,
    ),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor,
    dialogBackgroundColor: kBackgroundColor,
    fontFamily: fontName,
    iconTheme: IconThemeData(color: kIconColor),
    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: kBackgroundColor,
        iconTheme: IconThemeData(color: kIconColor)),
  );
}