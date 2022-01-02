import 'package:customized/customized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/domain/packages/entities/dependency.dart';
import 'package:flutter_package/src/presentation/settings/config_builder.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/application/packages/detail_package_view_model.dart';
import 'package:flutter_package/src/domain/core/i_advanced_service.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/presentation/core/base_widget.dart';
import 'package:flutter_package/src/presentation/core/failure_message_view.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_package/src/domain/packages/entities/score.dart';

/// [_TapInfo] title action visualization model
class _TapInfo extends BaseComponent {
  final String title;
  final VoidCallback onTap;

  _TapInfo({required this.title, required this.onTap}) : super(value: '');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Txt(
          title,
          textAlign: TextAlign.left,
          textSize: 14.0,
        )),
        IconButton(icon: Icon(Icons.refresh), onPressed: onTap)
      ],
    );
  }
}

/// [_Title] vertical title visualization model
class _Title extends BaseComponent {
  final String title;
  final String value;

  _Title({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Txt(
            value,
            textAlign: TextAlign.center,
            textStyle: (_) => _.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          Txt(
            title,
            textAlign: TextAlign.center,
            textSize: 12.0,
            textColor: kSubtitleTextColor,
          ),
        ],
      ),
      padding: EdgeInsets.all(4.0),
    );
  }
}

/// [_TitleDependency] dependency visualization model
class _TitleDependency extends BaseComponent {
  final Dependency dependencie;

  _TitleDependency({required this.dependencie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Txt(
            dependencie.name,
            maxLine: 2,
            textAlign: TextAlign.left,
            textStyle: (_) =>
                _.copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          Txt(
            ':',
            textAlign: TextAlign.center,
            textStyle: (_) =>
                _.copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          horizontalSpaceSmall(),
          Flexible(
              child: Txt(
            dependencie.version,
            maxLine: 1,
            textAlign: TextAlign.left,
            textColor: kSubtitleTextColor,
          )),
        ],
      ),
      padding: EdgeInsets.all(4.0),
    );
  }
}

/// [DetailPackageScreen]  viewing package details
class DetailPackageScreen extends StatefulWidget {
  static const route = '/detail_package_screen';
  final String name;

  DetailPackageScreen(this.name);

  @override
  DetailPackageScreenState createState() => DetailPackageScreenState();
}

class DetailPackageScreenState extends State<DetailPackageScreen>
    with SingleTickerProviderStateMixin {
  DetailPackageViewModel _model = DetailPackageViewModel(
      inject<IPackageRepository>(), inject<IAdvancedService>());

  /// get error message
  String _message() {
    if (!_model.hasError) return '';
    return _model.failure!.when<String>(
        networkError: () => 'no_internet_access',
        empty: () => 'no_results_found',
        serverError: () => 'server_failure');
  }

  /// responsible for viewing the score
  _bodyScore() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.only(top: 8.0),
      decoration: decoration(borderRadius: 8.0, color: kBackgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                  child: _Title(
                title: 'likes'.translate.toUpperCase(),
                value: '${_model.score.likeCount}',
              )),
              Expanded(
                  child: _Title(
                title: 'points'.translate.toUpperCase(),
                value: '${_model.score.likeCount}',
              )),
              Expanded(
                  child: _Title(
                title: 'popularity'.translate.toUpperCase(),
                value: _model.score.getPopularity(),
              )),
            ],
          )
        ],
      ),
    );
  }

  /// responsible for viewing the versions
  _bodyVersions() {
    if (_model.package.versions.isEmpty) return empty;

    return Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.only(top: 8.0),
      width: double.infinity,
      decoration: decoration(borderRadius: 8.0, color: kBackgroundColor),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(0.0),
        tilePadding: EdgeInsets.only(left: 16.0, right: 16.0),
        title: Txt(
          'versions'.translate,
          textStyle: (_) => _.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        children: [
          Container(
            padding: EdgeInsets.only(left: 2.0, right: 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  runSpacing: 0.0,
                  spacing: 5.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children:
                      List.generate(_model.package.versions.length, (index) {
                    var item = _model.package.versions[index];

                    return Chip(
                        padding: EdgeInsets.zero,
                        backgroundColor: kPlaceholderColor,
                        label: Container(
                          constraints: BoxConstraints(maxWidth: 65),
                          child: Center(
                            child: Txt(
                              item.version,
                              textStyle: (style) => style.copyWith(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLine: 1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ));
                  }).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// responsible for viewing the readme
  _bodyReadme(ThemeData themeData) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(_model.loadingReadme ? 16.0 : 0.0),
      margin: EdgeInsets.only(top: 8.0),
      decoration: decoration(borderRadius: 8.0, color: kBackgroundColor),
      child: (_model.loadingReadme)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: CustomProgress(),
                  width: 20,
                  height: 20,
                )
              ],
            )
          : ExpansionTile(
              initiallyExpanded: true,
              childrenPadding: EdgeInsets.all(0.0),
              tilePadding: EdgeInsets.only(left: 16.0, right: 16.0),
              title: Txt(
                'Readme',
                textStyle: (_) => _.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kTitleTextColor,
                  fontSize: 18,
                ),
              ),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    verticalSpaceSmall(),
                    if (_model.hasReadme)
                      Markdown(
                        selectable: true,
                        shrinkWrap: true,
                        data: _model.readme,
                        styleSheet: MarkdownStyleSheet.fromTheme(themeData),
                        physics: NeverScrollableScrollPhysics(),
                        // imageDirectory: 'https://raw.githubusercontent.com',
                        padding: EdgeInsets.all(16.0),
                        styleSheetTheme: MarkdownStyleSheetBaseTheme.platform,
                        extensionSet: md.ExtensionSet(
                            md.ExtensionSet.gitHubFlavored.blockSyntaxes, [
                          md.EmojiSyntax(),
                          ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes
                        ]),
                        onTapLink: (text, href, title) {
                          if (href == null) return;
                          Util.openLink(url: href);
                        },
                      ),
                    if (!_model.hasReadme)
                      Container(
                          padding: EdgeInsets.all(16.0),
                          child: FailureMessageView(
                            icon: 'info',
                            sizeIcon: 80,
                            message: 'error_readme'.translate,
                            onTap:  _model.loadReadme,
                          ))
                  ],
                )
              ],
            ),
    );
  }

  /// responsible for viewing the dependencies
  _bodyDependencies() {
    if (_model.package.dependencies.isEmpty) return empty;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8.0),
      decoration: decoration(borderRadius: 8.0, color: kBackgroundColor),
      child: ExpansionTile(
        initiallyExpanded: true,
        childrenPadding: EdgeInsets.all(0.0),
        tilePadding: EdgeInsets.only(left: 16.0, right: 16.0),
        title: Txt(
          'dependencies'.translate,
          textStyle: (_) => _.copyWith(
            fontWeight: FontWeight.bold,
            color: kTitleTextColor,
            fontSize: 18,
          ),
        ),
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                      _model.package.dependencies.length,
                      (index) => _TitleDependency(
                          dependencie: _model.package.dependencies[index]))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  /// viewing
  _build(ThemeData theme) {
    if (_model.isBusy && !_model.hasData) {
      return Center(child: CustomProgress());
    }
    if (_model.hasError && !_model.hasData) {
      return FailureMessageView(
        isColor: true,
        sizeIcon: 80,
        message: _message(),
        onTap: () {
          _model.load(widget.name);
        },
      );
    }
    if (!_model.hasData) {
      return FailureMessageView(
        isColor: true,
        sizeIcon: 80,
        message: _message(),
        onTap: () {
          _model.load(widget.name);
        },
      );
    }
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration:
                  decoration(borderRadius: 8.0, color: kBackgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Txt(
                    '${_model.package.name}\t${_model.package.latest.version}',
                    textStyle: (_) => _.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  verticalSpaceSmall(),
                  Txt(
                    '${_model.package.latest.pubspec.description}',
                    textStyle: (_) => _.copyWith(),
                  ),
                ],
              ),
            ),
            _bodyDependencies(),
            _bodyVersions(),
            _bodyScore(),
            _bodyReadme(theme)
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _model.load(widget.name);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ConfigBuilder(builder: (_, theme) {
        return Scaffold(
          backgroundColor: kPlaceholderColor,
          appBar: AppBar(
            brightness: theme.brightness,
            centerTitle: false,
            actions: <Widget>[
              if (_model.hasData)
                IconButton(
                    icon: CustomIcon(
                      icon: 'download',
                      size: 20,
                    ),
                    onPressed: () =>
                        Util.openLink(url: _model.package.latest.archive_url)),
              if (_model.hasData)
                IconButton(
                    icon: CustomIcon(
                      icon: 'share',
                      size: 20,
                    ),
                    onPressed: () =>
                        Util.shareProject(package: _model.package)),
              if (_model.hasData)
                IconButton(
                    icon: CustomIcon(
                      icon: 'github',
                      size: 20,
                    ),
                    onPressed: () => Util.openLink(
                        url: _model.package.latest.pubspec.homepage))
            ],
            elevation: 0.0,
            title: Txt(
              widget.name,
              textStyle: (_) => _.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
          body: _build(theme),
        );
      });
    });
  }
}
