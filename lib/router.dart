import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/presentation/packages/packages_screen.dart';
import 'package:flutter_package/src/presentation/search/search_screen.dart';
import 'package:flutter_package/src/presentation/settings/settings_screen.dart';
import 'package:flutter_package/src/presentation/splash_view_screen.dart';

import 'src/presentation/packages/detail_package_screen.dart';

class AnimationRouterPager extends MaterialPageRoute {
  WidgetBuilder builder;

  AnimationRouterPager({required this.builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case '/':
        page = SplashScreen();
        break;
      case PackagesScreen.route:
        page = PackagesScreen();
        break;
      case DetailPackageScreen.route:
        var name = settings.arguments as String;
        page = DetailPackageScreen.initialize(name: name);
        break;
      case SettingScreen.route:
        page = SettingScreen();
        break;
      case SearchScreen.route:
        page = SearchScreen();
        break;
      default:
        page = SplashScreen();
        break;
    }
    return Platform.isIOS
        ? CupertinoPageRoute(builder: (context) => page)
        : AnimationRouterPager(builder: (_) => page);
  }
}
