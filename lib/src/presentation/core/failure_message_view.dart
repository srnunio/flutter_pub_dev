import 'package:customized/customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/utils/uihelper.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/theme.dart';

import 'base_widget.dart';

class FailureMessageView extends BaseComponent {
  final String textButton;
  final Function()? onTap;
  String? icon;
  final double sizeIcon;
  final bool reference;
  final bool isColor;
  final Widget? button;

  bool get hasIcon => (icon != null && icon!.isNotEmpty);

  FailureMessageView(
      {required String message,
      this.onTap,
      this.textButton = 'try_again',
      this.icon,
      this.reference = true,
      this.button,
      this.isColor = false,
      this.sizeIcon = 50.0})
      : super(value: message);

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
          (hasIcon) ? UIHelper.verticalSpaceSmall() : empty,
          _icon(),
          (hasIcon) ? UIHelper.verticalSpaceSmall() : empty,
          _center(
            child: Txt(
              value!.translate,
              textColor: CustomTheme.titleColor,
              textAlign: TextAlign.center,
            ),
          ),
          UIHelper.verticalSpaceSmall(),
          if (button != null && onTap != null)
            InkWell(
              onTap: onTap,
              child: Container(
                width: 200,
                padding: EdgeInsets.all(8.0),
                child: _center(
                  child: Txt(
                    '${textButton}'.translate,
                    textStyle: (_) => _.copyWith(
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
