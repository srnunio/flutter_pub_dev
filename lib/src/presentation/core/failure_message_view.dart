import 'package:flutter/material.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';

import 'base_widget.dart';

class FailureMessageView extends BaseComponent {
  final String textButton;
  final Function()? onTap;
  final String? icon;
  final double sizeIcon;
  final bool reference;
  final bool isColor;
  final Widget? button;

  bool get hasIcon => (icon != null && icon!.isNotEmpty);

  FailureMessageView(
      {required String message,
      Key? key,
      this.onTap,
      this.textButton = 'try_again',
      this.icon,
      this.reference = true,
      this.button,
      this.isColor = false,
      this.sizeIcon = 50.0})
      : super(value: message,key: key);

  Center _center({required Widget child}) {
    return Center(
      child: child,
    );
  }

  _icon() {
    if (!hasIcon) return empty;

    return _center(
        child: CustomIcon(
      icon: icon!,
      size: sizeIcon,
      isColor: isColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          (hasIcon) ? verticalSpaceSmall() : empty,
          _icon(),
          (hasIcon) ? verticalSpaceSmall() : empty,
          _center(
            child: Text(
              value!,
              style: styleText(color: kTitleTextColor),
              textAlign: TextAlign.center,
            ),
          ),
          verticalSpaceSmall(),
          if (onTap != null)
            InkWell(
              onTap: onTap,
              child: Container(
                width: 200,
                padding: EdgeInsets.all(8.0),
                child: _center(
                  child: Text(
                    textButton.translate,
                    style: styleText(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
