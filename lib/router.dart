import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/presentation/packages/packages_screen.dart';
import 'package:flutter_package/src/presentation/settings_screen.dart';
import 'package:flutter_package/src/presentation/splash_view_screen.dart';

import 'src/presentation/packages/detail_package_screen.dart';

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case PackagesScreen.route:
        return MaterialPageRoute(builder: (_) => PackagesScreen());
      case DetailPackageScreen.route:
        var name = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => DetailPackageScreen(name));
      case SettingScreen.route:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
