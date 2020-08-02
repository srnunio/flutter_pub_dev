import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/core/utils/uihelper.dart';
import 'package:flutter_package/core/utils/utils.dart';
import 'package:flutter_package/core/viewmodels/package_details_view_model.dart';
import 'package:flutter_package/model/bloc_package_data.dart';
import 'package:flutter_package/model/domain/package.dart';
import 'package:flutter_package/view/components/icon_comp.dart';
import 'package:flutter_package/view/components/progress_comp.dart';
import 'package:flutter_package/view/components/text_comp.dart';
import 'package:flutter_package/view/styles.dart';
import '../../core/utils/uihelper.dart';
import '../styles.dart';

class DetailsPackage extends StatelessWidget {
  final Package package;

  DetailsPackage(this.package);

  @override
  Widget build(BuildContext context) {
    return _DetailsPackage(package);
  }
}

class _DetailsPackage extends StatefulWidget {
  final Package package;

  _DetailsPackage(this.package);

  @override
  State<StatefulWidget> createState() {
    return _DetailsPackageState(package);
  }
}

class _DetailsPackageState extends State<_DetailsPackage>
    with SingleTickerProviderStateMixin {
  final Package package;
  PackageDetailsViewModel model = PackageDetailsViewModel();
  final controller = ScrollController();

  _DetailsPackageState(this.package) {
    model.onPackage(package);
  }

  @override
  void initState() {
    super.initState();
    model.process();
  }



  _buildReadme() {
    if (model.readmeValue == null ||
        model.readmeValue.isEmpty ||
        model.readmeValue.toString().trim() == '404: Not Found' ||
        model.readmeValue.toString().trim() == '400: Invalid request') {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconComp(icon: 'bug', color: Styles.appColor, size: 100),
            UIHelper.verticalSpaceSmall(),
            TextComp(value: 'error_readme', reference: true)
          ],
        ),
      );
    }
    return Markdown(
      controller: controller,
      selectable: true,
      shrinkWrap: true,
      data: model.readmeValue,
      imageDirectory: 'https://raw.githubusercontent.com',
      styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
      onTapLink: (link) {
        Utils.logs('onTapLink (${link})}');
      },
    );
  }



  _build(){
    return Observer(builder: (_){
      if(model.isBusy) return ProgressComp();
      return LayoutBuilder(builder: (context, constraints) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: Styles.barColor,
          ),
        );
        return Container(
          color: Styles.backgroundColor,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
                backgroundColor: Styles.backgroundColor,
                body: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      actions: <Widget>[
                        IconButton(
                            icon: IconComp(icon: 'download'),
                            onPressed: () {
                              model.onDownload(
                                  url: model.package.latest.archive_url);
                            }),
                        IconButton(
                            icon: IconComp(icon: 'share'),
                            onPressed: () {
                              model.shareProject(
                                  context: context, package: model.package);
                            }),
                        IconButton(
                            icon: IconComp(icon: 'github'),
                            onPressed: () {
                              model.openGithub(
                                  url: model.package.latest.pubspec.homepage);
                            })
                      ],
                      floating: true,
                      elevation: 0.0,
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            TextComp(
                              value:
                              '${model.package.name}\t${model.package.latest.version}',
                              fontWeight: FontWeight.bold,
                              size: 24,
                            ),
                            UIHelper.verticalSpaceSmall(),
                            TextComp(
                                value:
                                '${model.package.latest.pubspec.description}',
                                maxLine: 10)
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: UIHelper.verticalSpaceSmall(),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        child: ExpansionTile(
                          title: TextComp(
                            value: 'versions',
                            reference: true,
                            fontWeight: FontWeight.bold,
                            size: 24,
                          ),
                          children: (model.package.versions == null)
                              ? []
                              : List.generate(model.package.versions.length,
                                  (index) {
                                var version = model.package.versions[index];
                                var last =
                                    index == (model.package.versions.length - 1);
                                return Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Styles.placeholderColor,
                                      borderRadius:
                                      BorderRadius.circular(Styles.border)),
                                  margin: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      top: 10,
                                      bottom: last ? 10 : 0),
                                  child: Row(
                                    children: <Widget>[
                                      UIHelper.horizontalSpaceMedium(),
                                      Expanded(
                                          child: TextComp(
                                              value: '${version.version}',
                                              fontWeight: FontWeight.bold)),
                                      IconButton(
                                          icon: IconComp(icon: 'download'),
                                          onPressed: () async {
                                            if (!await Utils.isConection()) {
                                              Utils.messageToast(
                                                  message: 'no_internet_access',
                                                  reference: true);
                                              return;
                                            }
                                            model.onDownload(
                                                url: version.archive_url);
                                          }),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: UIHelper.verticalSpaceSmall(),
                    ),
                    SliverToBoxAdapter(
                      child: _buildReadme(),
                    ),
                  ],
                )),
          ),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _build(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
