import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/utils/colors.dart';

class CustomProgress extends StatelessWidget {
  final Color? color;

  final double size;

  const CustomProgress({
    this.color,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    Color _color = (color != null) ? color! : kPrimaryColor;

    var brightness = Theme.of(context).brightness;

    return Container(
      child: (Platform.isIOS)
          ? MediaQuery(
              data: MediaQueryData(
                platformBrightness: brightness,
              ),
              child: CupertinoActivityIndicator())
          : CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(_color),
            ),
      width: size,
      height: size,
    );
  }
}
