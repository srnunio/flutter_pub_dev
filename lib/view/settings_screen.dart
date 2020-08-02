import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_package/core/utils/uihelper.dart';
import 'package:flutter_package/core/utils/utils.dart';
import 'package:flutter_package/model/bloc_app_event.dart';
import 'package:flutter_package/view/components/icon_comp.dart';
import 'package:flutter_package/view/components/text_comp.dart';
import 'package:flutter_package/view/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/utils/constants.dart';
import '../core/utils/uihelper.dart';
import 'styles.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SettingView();
  }
}

class _SettingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<_SettingView>
    with SingleTickerProviderStateMixin {
  _SettingState();

  @override
  void initState() {
    super.initState();
  }

  onGoGit() async {
    try {
      if (await canLaunch(Constants.GITHUB)) {
        await launch(
          Constants.GITHUB,
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    } catch (ex) {
      Utils.logs('onGoGit : Error => ${ex.toString()}');
      Utils.messageToast(message: 'try_again', reference: true);
    }
  }

  onGoPlayStore() async {
    try {
      if (await canLaunch(Constants.PLAYSTORE)) {
        await launch(
          Constants.PLAYSTORE,
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    } catch (ex) {
      Utils.logs('onGoPlayStore : Error => ${ex.toString()}');
      Utils.messageToast(message: 'try_again', reference: true);
    }
  }

  onGoWebsite() async {
    try {
      if (await canLaunch(Constants.PUBDEV)) {
        await launch(
          Constants.PUBDEV,
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    } catch (ex) {
      Utils.logs('onGoWebsite : Error => ${ex.toString()}');
      Utils.messageToast(message: 'try_again', reference: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Styles.backgroundColor,
          title: TextComp(
              value: 'about',
              reference: true,
              color: Styles.titleColor,
              fontWeight: FontWeight.bold),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      TextComp(
                          value: 'app',
                          reference: true,
                          color: Styles.titleColor,
                          fontWeight: FontWeight.bold),
                      TextComp(
                          value: 'v${Constants.VERSION_APP}',
                          color: Styles.subtitleColor,
                          size: 14.0),
                      TextComp(
                          value: 'app_desc',
                          reference: true,
                          color: Styles.subtitleColor,
                          size: 14.0),
                    ],
                  )),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Styles.placeholderColor, shape: BoxShape.circle),
                    child: Image.asset(
                      'assets/images/dartlogo.png',
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceMedium(),
              Divider(
                color: Styles.placeholderColor,
              ),
              UIHelper.verticalSpaceMedium(),
              InkWell(
                onTap: onGoGit,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Styles.placeholderColor,
                      borderRadius: BorderRadius.circular(Styles.border)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextComp(value: 'git_desc', reference: true)),
                      IconComp(icon: 'github')
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpaceMedium(),
              InkWell(
                onTap: onGoWebsite,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Styles.placeholderColor,
                      borderRadius: BorderRadius.circular(Styles.border)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextComp(value: 'website', reference: true)),
                      IconComp(icon: 'globe')
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpaceMedium(),
              Divider(color: Styles.placeholderColor),
            ],
          ),
        ),
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
