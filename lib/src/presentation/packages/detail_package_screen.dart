import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/domain/packages/entities/dependency.dart';
import 'package:flutter_package/src/domain/packages/entities/metric.dart';
import 'package:flutter_package/src/domain/packages/entities/version.dart';
import 'package:flutter_package/src/presentation/core/custom_progress.dart';
import 'package:flutter_package/src/presentation/core/custom_refresh.dart';
import 'package:flutter_package/src/presentation/core/dependency_item.dart';
import 'package:flutter_package/src/presentation/core/tag.dart';
import 'package:flutter_package/src/presentation/core/version_item.dart';
import 'package:flutter_package/src/presentation/settings/config_builder.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/application/packages/detail_package_view_model.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/presentation/core/base_widget.dart';
import 'package:flutter_package/src/presentation/core/failure_message_view.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/timed.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_package/src/domain/packages/entities/score.dart';

/// [_HorizontalTitle] horizontal title visualization model
class _HorizontalTitle extends BaseComponent {
  final String title;
  final String value;

  _HorizontalTitle({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title:',
            textAlign: TextAlign.center,
            style: styleText(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          horizontalSpaceSmall(),
          Text(
            value,
            textAlign: TextAlign.center,
            style: styleText(color: kSubtitleTextColor),
          ),
        ],
      ),
      padding: EdgeInsets.all(4.0),
    );
  }
}

/// [_VerticalTitle] vertical title visualization model
class _VerticalTitle extends BaseComponent {
  final String title;
  final String value;

  _VerticalTitle({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: styleText(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: styleText(fontSize: 12.0, color: kSubtitleTextColor),
          ),
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
  final DetailPackageViewModel _model = inject<DetailPackageViewModel>();



  /// open new package
  openDependency(String name) {
    if (_model.isBusy) return;
    _model.navigateToPushNamed(
        routeName: DetailPackageScreen.route, arguments: name);
  }

  /// get error message
  String _message() {
    if (!_model.hasError) return '';
    return _model.failure!
        .when<String>(
            networkError: () => 'no_internet_access',
            empty: () => 'no_results_found',
            serverError: () => 'server_failure')
        .translate;
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
                  child: _VerticalTitle(
                title: 'likes'.translate.toUpperCase(),
                value: '${_model.score.likeCount}',
              )),
              Expanded(
                  child: _VerticalTitle(
                title: 'points'.translate.toUpperCase(),
                value: '${_model.score.maxPoints}',
              )),
              Expanded(
                  child: _VerticalTitle(
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
        title: Text(
          'versions'.translate,
          style: styleText(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        children: [
          Container(
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 3.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 16.0,
                children:
                    List.generate(_model.package.versions.length, (index) {
                  var item = _model.package.versions[index];
                  var selected = (_model.version.version == item.version);
                  return VersionItem(
                    version: item,
                    onTap: () => _model.setVersion(item),
                    selected: selected,
                  );
                })),
          ),
          verticalSpaceMedium()
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
              title: Text(
                'Readme',
                style: styleText(
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
                            onTap: _model.loadReadme,
                          ))
                  ],
                )
              ],
            ),
    );
  }

  /// responsible for viewing the dependencies
  _bodyDependencies(
      {required List<Dependency> dependencies, required String title}) {
    if (dependencies.isEmpty) return empty;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8.0),
      decoration: decoration(borderRadius: 8.0, color: kBackgroundColor),
      child: ExpansionTile(
        initiallyExpanded: true,
        childrenPadding: EdgeInsets.all(0.0),
        tilePadding: EdgeInsets.only(left: 16.0, right: 16.0),
        title: Text(
          title,
          style: styleText(
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
              children: List.generate(dependencies.length, (index) {
                return DependencyItem(
                  dependency: dependencies[index],
                  openDependency: openDependency,
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  /// responsible for viewing the environment
  _bodyEnvironment() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8.0),
      decoration: decoration(borderRadius: 8.0, color: kBackgroundColor),
      child: ExpansionTile(
        initiallyExpanded: true,
        childrenPadding: EdgeInsets.all(0.0),
        tilePadding: EdgeInsets.only(left: 16.0, right: 16.0),
        title: Text(
          'environment'.translate,
          style: styleText(
            fontWeight: FontWeight.bold,
            color: kTitleTextColor,
            fontSize: 18,
          ),
        ),
        children: [
          Container(
            child:
                _HorizontalTitle(title: 'sdk', value: _model.environment.sdk),
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
          ),
          if (_model.environment.flutter.isNotEmpty)
            Container(
              child: _HorizontalTitle(
                  title: 'flutter', value: _model.environment.flutter),
              margin: EdgeInsets.only(left: 16.0, right: 16.0),
            ),
          verticalSpaceSmall()
        ],
      ),
    );
  }

  _bodyTag() {
    if (!_model.metric.isNotEmpty) return empty;

    var tags = _model.metric.tags;
    return Container(
      height: 38.0,
      padding: EdgeInsets.all(8.0),
      decoration: decoration(
        color: kPrimaryColor.withOpacity(.60),
        borderRadius: kBorder
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var separator = (index == 0) ? '' : '\t•\t';
          return Container(
            child: Text('$separator${tags[index]}',style: styleText(
              color: kBackgroundColor,
              fontWeight: FontWeight.bold
            ),),
          );
        },
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _bodyVersionSelected() {
    var isLastVersion =
        (_model.package.latest.version == _model.version.version);

    var timed = Timed.initialize(date: _model.version.date).time;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: decoration(borderRadius: 8.0, color: kBackgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (_model.metric.isNullSafe )
                Tag(value: 'null_safe'.translate),
              if (_model.metric.isNullSafe)
                horizontalSpaceSmall(),
              Text.rich(TextSpan(
                  text: '${'published'.translate}:',
                  style: styleText(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '\t$timed',
                      style: styleText(fontSize: 14.0),
                    )
                  ])),
            ],
          ),
          if (!isLastVersion) verticalSpaceSmall(),
          if (!isLastVersion)
            Text.rich(
              TextSpan(
                  text: '',
                  style: styleText(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0),
                  children: <InlineSpan>[
                    TextSpan(
                        text: '${'latest_version'.translate}:',
                        style: styleText(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0)),
                    TextSpan(
                      text: '\t${_model.package.latest.version}',
                      style: styleText(fontSize: 14.0),
                    )
                  ]),
              overflow: TextOverflow.fade,
              maxLines: 1,),
          if (!isLastVersion) verticalSpaceSmall(),
          Text(
            '${_model.package.name}\t${_model.version.version}',
            style: styleText(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          verticalSpaceSmall(),
          Text(
            '${_model.version.pubspec.description}',
          ),
          verticalSpaceSmall(),
          _bodyTag()
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
            _bodyVersionSelected(),
            _bodyEnvironment(),
            _bodyDependencies(
                title: 'dependencies'.translate,
                dependencies: _model.dependencies),
            _bodyDependencies(
                title: 'dev_dependencies'.translate,
                dependencies: _model.dev_dependencies),
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
              if (_model.hasData && !_model.isBusy)
                IconButton(
                    icon: CustomIcon(
                      icon: 'download',
                      size: 20,
                    ),
                    onPressed: () =>
                        Util.openLink(url: _model.package.latest.archive_url)),
              if (_model.hasData && !_model.isBusy)
                IconButton(
                    icon: CustomIcon(
                      icon: 'share',
                      size: 20,
                    ),
                    onPressed: () =>
                        Util.shareProject(package: _model.package)),
              if (_model.hasData && !_model.isBusy) Builder(builder: (context) {
                var _homePage = _model.package.latest.pubspec.homepage;
                if (_homePage.isNotEmpty)
                  return IconButton(
                      icon: CustomIcon(
                        icon: 'github',
                        size: 20,
                      ),
                      onPressed: () => Util.openLink(
                          url: _homePage));
                return SizedBox.shrink();
              })
            ],
            elevation: 0.0,
            title: Text(
              widget.name,
              style: styleText(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ),
          body: CustomRefresh(
            refresh: _model.refresh,
            child: _build(theme),
            enablePullUp: false,
            onRefresh: () => _model.load(widget.name),
          ),
        );
      });
    });
  }
}
