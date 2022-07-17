import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/presentation/core/custom_progress.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/search/search_screen.dart';
import 'package:flutter_package/src/presentation/settings/config_builder.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/application/packages/packages_view_model.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/presentation/core/custom_refresh.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:flutter_package/src/presentation/packages/item_package.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../settings/settings_screen.dart';
import 'detail_package_screen.dart';

class PackagesScreen extends StatefulWidget {
  static const route = '/packages_screen';

  @override
  PackagesScreenState createState() => PackagesScreenState();
}

class PackagesScreenState extends State<PackagesScreen>
    with SingleTickerProviderStateMixin {
  final PackagesViewModel _model = PackagesViewModel(inject<IPackageService>());

  ScrollController _controllerList = ScrollController();

  void goToTop() {
    if (_model.isBusy) return;
    _controllerList.animateTo(0.0,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  /// get error message
  String _message() {
    if (!_model.hasError) return '';

    return _model.failure!.when<String>(
        networkError: () => 'no_internet_access',
        empty: () => 'no_results_found',
        serverError: () => 'server_failure');
  }

  /// when data empty or has error
  _viewFailure() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              _message().translate,
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall(),
            CustomIcon(icon: 'swip', size: 80),
            verticalSpaceSmall(),
            verticalSpaceSmall(),
            Text(
              'update_view'.translate,
              textAlign: TextAlign.center,
              style: styleText(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }

  /// viewing
  _build() {
    return Observer(builder: (_) {
      /// when loading and data empty
      if (_model.isBusy && !_model.hasData)
        return Center(child: CustomProgress());

      /// when data empty and has error
      if (_model.hasError && !_model.hasData) {
        return CustomRefresh(
          refresh: _model.refresh,
          child: _viewFailure(),
          enablePullUp: false,
          onRefresh: () => _model.load(refresh: true),
        );
      }

      /// when data empty
      if (!_model.hasData) {
        return CustomRefresh(
          refresh: _model.refresh,
          child: _viewFailure(),
          enablePullUp: false,
          onRefresh: () => _model.load(refresh: true),
        );
      }

      /// list results
      return CustomRefresh(
        refresh: _model.refresh,
        child: StaggeredGridView.countBuilder(
          controller: _controllerList,
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: _model.packages.length,
          itemBuilder: (context, index) {
            var package = _model.packages[index];

            return Container(
              child: ItemPackage(
                onTap: () async {
                  _model.navigateToPushNamed(
                      routeName: DetailPackageScreen.route,
                      arguments: package.name);
                },
                onLink: (url) async {
                  Util.openLink(url: url);
                },
                onShare: () => Util.shareProject(package: package),
                package: package,
              ),
            );
          },
          staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
        ),
        enablePullDown: true,
        onRefresh: () => _model.load(refresh: true),
        onLoading: () => _model.load(),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _model.load();
  }

  @override
  Widget build(BuildContext context) {
    return ConfigBuilder(builder: (_, theme) {
      return Scaffold(
        appBar: AppBar(
          brightness: theme.brightness,
          centerTitle: false,
          actions: <Widget>[
            IconButton(
                icon: CustomIcon(icon: 'search'),
                onPressed: () {
                  _model.navigateToPushNamed(routeName: SearchScreen.route);
                }),
            IconButton(
                icon: CustomIcon(icon: 'settings'),
                onPressed: () {
                  _model.navigateToPushNamed(routeName: SettingScreen.route);
                }),
          ],
          elevation: 0.0,
          title: TextButton(
            onPressed: goToTop,
            child: Text(
              'app'.translate,
              style: styleText(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: _build(),
        ),
      );
    });
  }
}
