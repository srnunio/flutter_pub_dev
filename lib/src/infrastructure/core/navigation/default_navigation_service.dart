import 'package:flutter/material.dart';
import 'package:flutter_package/src/domain/core/navigation/navigation_service.dart';

class DefaultNavigationService extends NavigationService {
  DefaultNavigationService(GlobalKey<NavigatorState> navigator)
      : super(navigator);

  @override
  Future<dynamic> navigateToPushNamed(String routeName,
      {Object arguments}) async {
    return await navigator.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> navigateToPushNamedAndRemoveUntil(String routeName) async {
    print('navigateToPushNamedAndRemoveUntil: ${routeName}');
    return await navigator.currentState
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  @override
  Future navigateToPop({Object object}) async {
    return navigator.currentState.pop(object);
  }
}
