import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/domain/core/i_advanced_service.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/entities/score.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:mobx/mobx.dart';

part 'detail_package_view_model.g.dart';

class DetailPackageViewModel = _DetailPackageViewModel
    with _$DetailPackageViewModel;

abstract class _DetailPackageViewModel extends BaseViewModel with Store {
  _DetailPackageViewModel(this._repository, this._advancedService);

  final IPackageRepository _repository;

  final IAdvancedService _advancedService;

  @observable
  Package? _package;

  @observable
  Score _score = Score.default_;

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
  Score get score => _score;

  @computed
  String get readme => _readme;

  @computed
  bool get hasData => _package != null;

  @computed
  bool get hasReadme => (_readme != null && _readme.isNotEmpty);

  @computed
  bool get hasScore => (_score != null);

  @computed
  bool get loadingReadme => _loadingReadme;

  @action
  void setPackage(Package package) {
    this._package = package;
  }

  @action
  Future<void> load(String namePackage, {bool refresh = false}) async {
    if (isBusy) {
      return;
    }
    if (refresh) {
      onRefresh(value: refresh);
    }

    setBusy(true);

    failure = null;

    final response = await _repository.getPackageName(namePackage: namePackage);

    setBusy(false);

    onRefresh(value: false);

    response.fold(
      (failure) => this.failure = failure,
      (data) {
        setPackage(data);
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
    var response = await _repository.getScorePackage(namePackage: package.name);
    response.fold((failure) {}, (data) => this._score = data);
  }
}
