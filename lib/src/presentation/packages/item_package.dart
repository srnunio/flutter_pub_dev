import 'package:customized/customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/utils/uihelper.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/presentation/core/side_rounded.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/theme.dart';

class ItemPackage extends StatelessWidget {
  Package package;
  ValueChanged<String> onLink;
  Function onShare;
  Function onTap;
  Size size;

  ItemPackage(
      {this.package,
      this.onLink,
      this.onShare,
      this.onTap});

  _build() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(4.0),
      decoration:
          decoration(color: CustomTheme.backgroundColor, borderRadius: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/dartlogo.png',
                    height: 40,
                    width: 40,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomTheme.backgroundColor,
                  ),
                ),
                Txt(
                  '${package.name}',
                  textAlign: TextAlign.center,
                  textStyle: (_) => _.copyWith(
                      color: CustomTheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                  maxLine: 1,
                ),
                UIHelper.verticalSpaceSmall(),
                Txt(
                  '${package.latest.pubspec.description}',
                  textAlign: TextAlign.center,
                  textStyle: (_) => _.copyWith(
                      color: CustomTheme.subtitleColor, fontSize: 12.0),
                  maxLine: 2,
                ),
              ],
            ),
          )),
          UIHelper.verticalSpaceSmall(),
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
                    color: Colors.black,
                  ),
                  onTap: onShare,
                ),
                InkWell(
                  child: CustomIcon(
                    icon: 'github',
                    size: 18,
                    color: Colors.black,
                  ),
                  onTap:() => onLink(package.latest.pubspec.homepage),
                ),
                SizedBox(
                  height: 40,
                  width: size.width * .2,
                  child: SideRounded(
                    color: CustomTheme.primary,
                    child: Txt(
                      '${package.latest.version}',
                      textAlign: TextAlign.left,
                      textStyle: (_) => _.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                      maxLine: 1,
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
