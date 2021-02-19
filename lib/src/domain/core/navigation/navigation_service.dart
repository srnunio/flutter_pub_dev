import 'package:flutter/material.dart';

abstract class NavigationService {
  final GlobalKey<NavigatorState> navigator;

  GlobalKey<ScaffoldState> get scaffoldState => GlobalKey<ScaffoldState>();

  NavigationService(this.navigator);

  @override
  Future<dynamic> navigateToPushNamed(String routeName, {Object arguments});

  Future<dynamic> navigateToPushNamedAndRemoveUntil(String routeName);

  Future<dynamic> navigateToPop({Object object});
}
