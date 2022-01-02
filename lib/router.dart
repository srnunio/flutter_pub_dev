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
    switch (settings.name) {
      case '/':
        return AnimationRouterPager(builder: (_) => SplashScreen());
      case PackagesScreen.route:
        return AnimationRouterPager(builder: (_) => PackagesScreen());
      case DetailPackageScreen.route:
        var name = settings.arguments as String;
        return AnimationRouterPager(builder: (_) => DetailPackageScreen(name));
      case SettingScreen.route:
        return AnimationRouterPager(builder: (_) => SettingScreen());
      case SearchScreen.route:
        return AnimationRouterPager(builder: (_) => SearchScreen());
      default:
        return AnimationRouterPager(builder: (_) => SplashScreen());
    }
  }
}
