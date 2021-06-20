import 'package:flutter/material.dart';

class SideRounded extends StatelessWidget {
  final Widget child;
  final double radious;
  final Color color;

  const SideRounded({
    Key? key,
    required this.child,
    this.color = Colors.black,
    this.radious = 29,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radious),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: child,
    );
  }
}
