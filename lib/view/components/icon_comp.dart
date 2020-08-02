import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles.dart';

class IconComp extends StatelessWidget {
  String icon;
  Color color;
  double size;

  IconComp({this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    color = color ?? Styles.colorIcon;
    size = size ?? Styles.sizeIcon;
    return Center(
      child: SvgPicture.asset('assets/icons/${icon}.svg',
          height: size, width: size, color: color),
    );
  }
}
