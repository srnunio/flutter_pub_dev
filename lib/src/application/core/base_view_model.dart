import 'package:flutter/cupertino.dart';
import 'package:flutter_package/src/domain/core/navigation/navigation_service.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'base_view_model.g.dart';

class BaseViewModel = _BaseViewModel with _$BaseViewModel;

abstract class _BaseViewModel with Store {
  NavigationService get _navigation => inject<NavigationService>();

  @observable
  bool _isBusy = false;

  @computed
  bool get isBusy => _isBusy;

  final RefreshController refresh = new RefreshController(
    initialRefresh: false,
  );

  void onRefresh({bool value = false}) {
    if (value) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => refresh.requestRefresh());
    } else {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => refresh.refreshCompleted(resetFooterState: true));

      WidgetsBinding.instance
          .addPostFrameCallback((_) => refresh.loadComplete());
    }
  }

  @action
  void setBusy(bool state) {
    _isBusy = state;
  }

  Future<dynamic> navigateToPushNamedAndRemoveUntil(
      {@required String routeName}) async {
    return await _navigation.navigateToPushNamedAndRemoveUntil(routeName);
  }

  Future<dynamic> navigateToPushNamed(
      {@required String routeName, Object arguments}) async {
    return await _navigation.navigateToPushNamed(routeName,
        arguments: arguments);
  }

  Future<dynamic> navigateToPop({Object obj}) async {
    return await _navigation.navigateToPop(object: obj);
  }

  VoidCallback _onFailure;

  VoidCallback _onBusy;
}
