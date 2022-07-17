import 'package:flutter_package/src/domain/packages/entities/dependency.dart';
import 'package:flutter_package/src/domain/packages/entities/environment.dart';
import 'package:flutter_package/src/domain/packages/entities/metric.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/domain/core/i_advanced_service.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/entities/score.dart';
import 'package:flutter_package/src/domain/packages/entities/version.dart';
import 'package:mobx/mobx.dart';

import '../../domain/packages/i_package_service.dart';

part 'detail_package_view_model.g.dart';

class DetailPackageViewModel = _DetailPackageViewModel
    with _$DetailPackageViewModel;

abstract class _DetailPackageViewModel extends BaseViewModel with Store {
  _DetailPackageViewModel(this._service, this._advancedService);

  final IPackageService _service;

  final IAdvancedService _advancedService;

  @observable
  Package? _package;

  @observable
  Version? _version;

  @observable
  Metric _metric = Metric.empty;

  @observable
  String _readme = '';

  @observable
  bool _loadingReadme = false;

  @observable
  RequestFailure? failure = null;

  @computed
  bool get hasError => failure != null;

  @computed
  Package get package => _package!;

  @computed
  Score get score => _metric.score;

  @computed
  Metric get metric => _metric;

  @computed
  Version get version => _version!;

  @computed
  List<Dependency> get dependencies => _version!.pubspec.dependencies;

  @computed
  List<Dependency> get dev_dependencies => _version!.pubspec.dev_dependencies;

  @computed
  Environment get environment => _version!.pubspec.environment;

  @computed
  String get readme => _readme;

  @computed
  bool get hasData => _package != null;

  @computed
  bool get hasReadme => (_readme != null && _readme.isNotEmpty);

  @computed
  bool get loadingReadme => _loadingReadme;

  @action
  void setPackage(Package package) {
    this._package = package;
  }

  @action
  void setVersion(Version version) {
    this._version = version;
  }

  @action
  Future<void> load(String namePackage, {bool refresh = false}) async {
    if (isBusy) return;

    if (refresh) onRefresh(value: refresh);

    setBusy(true);

    failure = null;

    final response = await _service.getPackageName(namePackage: namePackage);

    setBusy(false);

    onRefresh(value: false);

    response.fold(
      (failure) => this.failure = failure,
      (data) {
        setPackage(data);
        setVersion(data.latest);
        loadReadme();
        loadScore();
      },
    );
  }

  @action
  Future<void> loadReadme() async {
    _loadingReadme = true;
    var response = await _advancedService.getReadme(
        gitPath: package.latest.pubspec.homepage);
    _loadingReadme = false;
    response.fold(
        (failure) => this._readme = '', (data) => this._readme = data);
  }

  @action
  Future<void> loadScore() async {
    var response = await _service.getMetricPackage(package: package.name);
    response.fold((failure) {}, (metric) => this._metric = metric);
  }
}
