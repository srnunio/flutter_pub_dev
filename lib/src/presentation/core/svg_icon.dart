import 'package:flutter/material.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

import 'base_widget.dart';

class CustomIcon extends BaseComponent {
  final double? size;
  final Color? color;
  final isColor;

  CustomIcon({this.size, this.color, required String icon, this.isColor = false}) : super(value: icon);

  @override
  Widget build(BuildContext context) {
    final size = this.size ?? 24;
    final color = (isColor) ? null : this.color;
    return SvgPicture.asset(
      'assets/icons/$value.svg',
      colorFilter: ColorFilter.mode(color ?? kIconColor, BlendMode.srcIn),
      height: size,
      width: size,
    );
  }
}

class SvgImage extends BaseComponent {
  final double height;
  final double width;

  SvgImage({
    required this.height,
    required this.width,
    required String icon,
  }) : super(value: icon);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$value.svg',
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}
