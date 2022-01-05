import 'package:flutter/material.dart';

abstract class NavigationService {
  final GlobalKey<NavigatorState> navigator;

  GlobalKey<ScaffoldState> get scaffoldState => GlobalKey<ScaffoldState>();

  NavigationService(this.navigator);

  /// [navigateToPushNamed] Function responsible for calling
  /// a new application screen by route base
  Future<dynamic> navigateToPushNamed(String routeName, {Object? arguments});

  /// [replaceRouteName] Function responsible for replacing
  /// a application screen by route base
  Future<dynamic> navigateToPushNamedAndRemoveUntil(String routeName);

  /// [navigateToPop] Function responsible for closing the application screen
  Future<dynamic> navigateToPop({Object? object});
}
