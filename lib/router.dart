import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/model/domain/package.dart';
import 'package:flutter_package/view/packages/all_packages.dart';
import 'package:flutter_package/view/settings_screen.dart';
import 'package:flutter_package/view/splash_view_screen.dart';
import 'main.dart';
import 'view/packages/details_package.dart';

class Router {
  static const RouterPackageViewScreen = 'PackageViewScreen';
  static const RouterPackageHomeScreen = 'PackageHomeScreen';
  static const RouterSettingScreen= 'SettingScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouterPackageHomeScreen:
        return MaterialPageRoute(builder: (_) => PackageHomeScreen());
      case RouterPackageViewScreen:
        var package = settings.arguments as Package;
        return MaterialPageRoute(builder: (_) => DetailsPackage(package));
        case RouterSettingScreen:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
