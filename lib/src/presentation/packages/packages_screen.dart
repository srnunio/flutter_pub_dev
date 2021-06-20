import 'package:customized/customized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/presentation/search/search_screen.dart';
import 'package:flutter_package/src/utils/uihelper.dart';
import 'package:flutter_package/src/application/packages/packages_view_model.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/presentation/core/custom_refresh.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/theme.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:flutter_package/src/presentation/packages/item_package.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../settings_screen.dart';
import 'detail_package_screen.dart';

class PackagesScreen extends StatefulWidget {
  static const route = '/packages_screen';

  @override
  PackagesScreenState createState() => PackagesScreenState();
}

class PackagesScreenState extends State<PackagesScreen>
    with SingleTickerProviderStateMixin {
  PackagesViewModel _model = PackagesViewModel(inject<IPackageRepository>());

  @override
  void initState() {
    super.initState();
    _model.load();
  }

  _viewFailure() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Txt(
              _message().translate,
              textAlign: TextAlign.center,
              textColor: Colors.black,
            ),
            UIHelper.verticalSpaceSmall(),
            CustomIcon(icon: 'swip', size: 80),
            UIHelper.verticalSpaceSmall(),
            UIHelper.verticalSpaceSmall(),
            Txt(
              'update_view'.translate,
              textAlign: TextAlign.center,
              textStyle: (_) => _.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: CustomTheme.primary),
            )
          ],
        ),
      ),
    );
  }

  String _message() {
    if (!_model.hasError) return '';

    return _model.failure!.when<String>(
        networkError: () => 'no_internet_access',
        empty: () => 'no_results_found',
        serverError: () => 'server_failure');
  }

  _build() {
    return Observer(builder: (_) {
      if (_model.isBusy && !_model.hasData) {
        return Center(child: CustomProgress());
      }
      if (_model.hasError && !_model.hasData) {
        return CustomRefresh(
          refresh: _model.refresh,
          child: _viewFailure(),
          enablePullUp: false,
          onRefresh: () => _model.load(refresh: true),
        );
      }
      if (!_model.hasData) {
        return CustomRefresh(
          refresh: _model.refresh,
          child: _viewFailure(),
          enablePullUp: false,
          onRefresh: () => _model.load(refresh: true),
        );
      }

      return CustomRefresh(
        refresh: _model.refresh,
        child: StaggeredGridView.countBuilder(
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
                onShare: () async {},
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: CustomTheme.brightness,
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
        title: Txt(
          'app'.translate,
          textStyle: (_) => _.copyWith(
              color: CustomTheme.primary, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: _build(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
