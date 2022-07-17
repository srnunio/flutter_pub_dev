import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:mobx/mobx.dart';

import '../../domain/packages/i_package_service.dart';

part 'packages_view_model.g.dart';

class PackagesViewModel = _PackagesViewModel with _$PackagesViewModel;

abstract class _PackagesViewModel extends BaseViewModel with Store {
  _PackagesViewModel(this._service);

  final IPackageService _service;

  int _page = 1;

  @observable
  ObservableList<Package> _packages = ObservableList.of([]);

  @observable
  RequestFailure? _failure = null;

  @computed
  bool get hasError => _failure != null;

  @computed
  RequestFailure get failure => _failure!;

  @computed
  List<Package> get packages => _packages.toList();

  @computed
  bool get hasData => _packages.isNotEmpty;

  @action
  void _setData(List<Package> list, bool refresh) {
    if (list.isNotEmpty) {
      if (!hasData || refresh) {
        this._packages = list.asObservable();
      } else {
        this._packages.addAll(list.asObservable());
      }
    }
  }

  bool _setFailure(RequestFailure? failure) {
    _failure = failure;
    return false;
  }

  bool _onSuccessfully(bool refresh, List<Package> data) {
    _setData(data, refresh);
    _page++;
    return true;
  }

  @action
  Future<bool> load({bool refresh = false}) async {
    if (isBusy) return false;

    if (refresh) {
      _page = 1;
      onRefresh(value: refresh);
    }

    setBusy(true);

    _failure = null;

    final _response = await _service.getPackages(page: _page);

    setBusy(false);

    onRefresh(value: false);

    return _response.fold(
      _setFailure,
      (data) => _onSuccessfully(refresh, data),
    );
  }
}
