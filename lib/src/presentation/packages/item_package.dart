import 'package:customized/customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/presentation/core/side_rounded.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';

class ItemPackage extends StatelessWidget {
  final Package package;
  final ValueChanged<String> onLink;
  final Function() onShare;
  final Function() onTap;

  Size size = Size(0.0, 0.0);

  ItemPackage(
      {required this.package,
      required this.onLink,
      required this.onShare,
      required this.onTap});

  _build() {
    return Container(
      padding: EdgeInsets.all(0.0),
      decoration: decoration(color: kPlaceholderColor, borderRadius: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Image.asset(
              'assets/images/dartlogo.png',
              height: 40,
              width: 40,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kBackgroundColor,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Txt(
              '${package.name}',
              textAlign: TextAlign.center,
              textStyle: (_) => _.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              maxLine: 3,
            ),
          ),
          verticalSpaceSmall(),
          Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Txt(
              '${package.latest.pubspec.description}',
              textAlign: TextAlign.center,
              textStyle: (_) =>
                  _.copyWith(color: kSubtitleTextColor, fontSize: 14.0),
              maxLine: 3,
            ),
          ),
          verticalSpaceSmall(),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: CustomIcon(
                    icon: 'share',
                    size: 18,
                    color: kIconColor,
                  ),
                  onTap: onShare,
                ),
                SizedBox(
                  height: 40,
                  width: size.width * .2,
                  child: SideRounded(
                    color: kPrimaryColor,
                    child: Txt(
                      '${package.latest.version}',
                      textAlign: TextAlign.center,
                      textStyle: (_) => _.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                      maxLine: 2,
                    ),
                    radious: 30,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: _build(),
      onTap: onTap,
    );
  }
}
