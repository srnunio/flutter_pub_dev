import 'package:flutter/foundation.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:mobx/mobx.dart';

part 'packages_view_model.g.dart';

class PackagesViewModel = _PackagesViewModel with _$PackagesViewModel;

abstract class _PackagesViewModel extends BaseViewModel with Store {
  _PackagesViewModel(this._repository) : assert(_repository != null);

  final IPackageRepository _repository;

  int _page = 1;

  @observable
  ObservableList<Package> _packages = ObservableList.of([]);

  @observable
  RequestFailure failure = null;

  @computed
  bool get hasError => failure != null;

  @computed
  List<Package> get packages => _packages.toList();

  @computed
  bool get hasData => _packages.isNotEmpty;

  @action
  void setData(List<Package> list, bool refresh) {
    if (list.isNotEmpty) {
      if (!hasData || refresh) {
        this._packages = list.asObservable();
      } else {
        this._packages.addAll(list.asObservable());
      }
    }
  }

  @action
  Future<void> load({bool refresh = false}) async {
    if (isBusy) {
      return;
    }
    if (refresh) {
      _page = 1;
      onRefresh(value: refresh);
    }

    setBusy(true);

    failure = null;

    final _response = await _repository.getPackages(page: _page);

    setBusy(false);

    onRefresh(value: false);

    _response.fold(
      (failure) {
        this.failure = failure;
      },
      (data) {
        setData(data, refresh);
        _page++;
      },
    );
  }
}
