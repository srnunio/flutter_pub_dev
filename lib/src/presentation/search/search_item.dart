import 'package:customized/customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/presentation/core/base_widget.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';

/// [SearchItem]
class SearchItem extends BaseComponent {
  Function() onTap;

  SearchItem({required String name, required this.onTap}) : super(value: name);

  _build() {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      decoration: decoration(color: kPlaceholderColor, borderRadius: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/images/dartlogo.png',
              height: 24,
              width: 24,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kBackgroundColor,
            ),
          ),
          horizontalSpaceSmall(),
          Expanded(
              child: Txt(
            '${value}',
            textAlign: TextAlign.left,
            textStyle: (_) =>
                _.copyWith(color: kTitleTextColor, fontSize: 16.0),
            maxLine: 1,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: _build(),
      onTap: onTap,
    );
  }
}
