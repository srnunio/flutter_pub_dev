import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/core/utils/uihelper.dart';
import 'package:flutter_package/model/domain/package.dart';
import 'package:flutter_package/view/components/icon_comp.dart';
import 'package:flutter_package/view/components/text_comp.dart';
import 'package:flutter_package/view/components/side_rounded.dart';
import 'package:flutter_package/view/styles.dart';

class ItemPackage extends StatelessWidget {
  Package package;
  Function onGithub;
  Function onShare;
  Function onOpen;
  Function onDownload;
  Size size;

  ItemPackage(
      {this.package,
      this.onGithub,
      this.onShare,
      this.onOpen,
      this.onDownload});

  _build() {
    return Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Styles.border),
          color: Styles.placeholderColor),
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
                    color: Styles.backgroundColor,
                  ),
                ),
                TextComp(
                  value: '${package.name}',
                  color: Styles.titleColor,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.center,
                  maxLine: 1,
                  size: 16.0,
                ),
                UIHelper.verticalSpaceSmall(),
                TextComp(
                    value: '${package.latest.pubspec.description}',
                    color: Styles.subtitleColor,
                    maxLine: 2,
                    size: 10.0,
                    align: TextAlign.center),
              ],
            ),
          )),
          UIHelper.verticalSpaceSmall(),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: IconComp(icon: 'share', size: 20),
                  onTap: onShare,
                ),
                InkWell(
                  child: IconComp(icon: 'github', size: 20),
                  onTap: onGithub,
                ),
                SizedBox(
                  height: 40,
                  width: size.width * .2,
                  child: SideRounded(
                    color: Styles.appColor,
                    child: TextComp(
                        value: '${package.latest.version}',
                        color: Colors.white,
                        maxLine: 1,
                        fontWeight: FontWeight.bold,
                        align: TextAlign.center,
                        size: 12.0),
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
      child: _build(),
      onTap: onOpen,
    );
  }
}
