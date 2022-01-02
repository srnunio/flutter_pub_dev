import 'package:flutter/material.dart';
import 'package:flutter_package/src/presentation/core/base_widget.dart';

import 'custom_switch.dart';

class TitleSwitch extends BaseComponent {
  final Function(bool)? onTap;
  final CustomSwitchController controller;

  TitleSwitch({
    Key? key,
    required String title,
    required this.controller,
    required this.onTap,
  }) : super(value: title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: Text(value!)),
          CustomSwitch(
            controller: controller,
            width: 42.0,
            height: 28.0,
            onChange: onTap,
          )
        ],
      ),
    );
  }
}
