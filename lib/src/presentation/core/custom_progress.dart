import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  final Color? color;

  final double size;

  final bool ignorePlatform;

  const CustomProgress(
      {this.color, this.size = 20, this.ignorePlatform = false});

  @override
  Widget build(BuildContext context) {
    Color _color = (color != null) ? color! : Theme.of(context).accentColor;

    var brightness = Theme.of(context).brightness;

    Widget widget;

    if (ignorePlatform) {
      widget = CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(_color),
      );
    } else {
      widget = (Platform.isIOS)
          ? MediaQuery(
          data: MediaQueryData(platformBrightness: brightness),
          child: CupertinoActivityIndicator())
          : CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(_color),
      );
    }

    return Container(
      child: widget,
      width: size,
      height: size,
    );
  }
}