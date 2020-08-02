import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/core/viewmodels/package_view_model.dart';
import 'package:flutter_package/view/components/icon_comp.dart';
import 'package:flutter_package/view/components/progress_comp.dart';
import 'package:flutter_package/view/components/text_comp.dart';
import 'package:flutter_package/core/utils/uihelper.dart';
import 'package:flutter_package/core/utils/utils.dart';
import 'package:flutter_package/view/styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../router.dart';
import '../styles.dart';
import 'item_package.dart';

class PackageHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _PackageView();
  }
}

class _PackageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PackageState();
  }
}

class _PackageState extends State<_PackageView>
    with SingleTickerProviderStateMixin {
  PackageViewModel model = PackageViewModel();

  @override
  void initState() {
    super.initState();
    model.readAllPackages();
  }

  _buildLoad() {
    return Scaffold(
      body: ProgressComp(),
    );
  }
  _refresh(Widget child){
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.loading) {
            body = ProgressComp();
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: model.refresh,
      onRefresh: model.onRefresh,
      onLoading: model.onLoading,
      child: child,
    );
  }
  _build(){
    return Observer(builder: (_) {
      if (model.isBusy && !model.isData) return ProgressComp();
      if (!model.isData)
        return _refresh(Center(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextComp(
                    value: 'empty_packages',
                    reference: true,
                    align: TextAlign.center),
                UIHelper.verticalSpaceSmall(),
                IconComp(icon: 'swip', color: Styles.appColor, size: 50),
                UIHelper.verticalSpaceSmall(),
                TextComp(
                    value: 'update_view',
                    fontWeight: FontWeight.bold,
                    size: 20.0,
                    color: Styles.appColor,
                    reference: true,
                    align: TextAlign.center)
              ],
            ),
          ),
        ));
      return _refresh ( GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.0),
          itemCount: model.packages.length,
          itemBuilder: (context, index) {
            return Container(
              child: ItemPackage(
                onOpen: () async {
                  if (!await Utils.isConection()) {
                    Utils.messageToast(
                        message: 'no_internet_access', reference: true);
                    return;
                  }
                  Navigator.pushNamed(
                      context, Router.RouterPackageViewScreen,
                      arguments: model.packages[index]);
                },
                onGithub: () async {
                  if (!await Utils.isConection()) {
                    Utils.messageToast(
                        message: 'no_internet_access', reference: true);
                    return;
                  }
                  model.openGithub(
                      url: model.packages[index].latest.pubspec.homepage);
                },
                onShare: () async {
                  if (!await Utils.isConection()) {
                    Utils.messageToast(
                        message: 'no_internet_access', reference: true);
                    return;
                  }
                  model.shareProject(
                      context: context, package: model.packages[index]);
                },
                onDownload: () async {
                  if (!await Utils.isConection()) {
                    Utils.messageToast(
                        message: 'no_internet_access', reference: true);
                    return;
                  }
                  model.onDownload(
                      url: model.packages[index].latest.archive_url);
                },
                package: model.packages[index],
              ),
            );
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Styles.themeData.brightness,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              icon: IconComp(icon: 'settings'),
              onPressed: () {
                Navigator.pushNamed(context, Router.RouterSettingScreen);
              }),
        ],
        elevation: 0.0,
        title: TextComp(
            value: 'app',
            color: Styles.appColor,
            reference: true,
            size: 20,
            fontWeight: FontWeight.bold),
      ),
      body: _build(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
