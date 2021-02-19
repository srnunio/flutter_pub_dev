import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_package/src/utils/theme.dart';
import 'package:flutter_svg/svg.dart';

import 'base_widget.dart';

class CustomIcon extends BaseComponent {
  double size;
  Color color;
  final isColor;

  CustomIcon({this.size, this.color, @required String icon, this.isColor = false})
      : super(value: icon);

  @override
  Widget build(BuildContext context) {
    size = size ?? 24;
    color = (isColor) ? null : color ?? CustomTheme.colorIcon;
    return SvgPicture.asset(
      'assets/icons/${value}.svg',
      height: size,
      width: size,
      color: color,

    );
  }
}


class SvgImage extends BaseComponent {
  double height;
  double width;

  SvgImage({this.height, this.width, String icon,})
      : super(value: icon);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/${value}.svg',
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
