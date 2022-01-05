// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_package_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailPackageViewModel on _DetailPackageViewModel, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_DetailPackageViewModel.hasError'))
          .value;
  Computed<Package>? _$packageComputed;

  @override
  Package get package =>
      (_$packageComputed ??= Computed<Package>(() => super.package,
              name: '_DetailPackageViewModel.package'))
          .value;
  Computed<Score>? _$scoreComputed;

  @override
  Score get score => (_$scoreComputed ??= Computed<Score>(() => super.score,
          name: '_DetailPackageViewModel.score'))
      .value;
  Computed<Metric>? _$metricComputed;

  @override
  Metric get metric =>
      (_$metricComputed ??= Computed<Metric>(() => super.metric,
              name: '_DetailPackageViewModel.metric'))
          .value;
  Computed<Version>? _$versionComputed;

  @override
  Version get version =>
      (_$versionComputed ??= Computed<Version>(() => super.version,
              name: '_DetailPackageViewModel.version'))
          .value;
  Computed<List<Dependency>>? _$dependenciesComputed;

  @override
  List<Dependency> get dependencies => (_$dependenciesComputed ??=
          Computed<List<Dependency>>(() => super.dependencies,
              name: '_DetailPackageViewModel.dependencies'))
      .value;
  Computed<List<Dependency>>? _$dev_dependenciesComputed;

  @override
  List<Dependency> get dev_dependencies => (_$dev_dependenciesComputed ??=
          Computed<List<Dependency>>(() => super.dev_dependencies,
              name: '_DetailPackageViewModel.dev_dependencies'))
      .value;
  Computed<Environment>? _$environmentComputed;

  @override
  Environment get environment =>
      (_$environmentComputed ??= Computed<Environment>(() => super.environment,
              name: '_DetailPackageViewModel.environment'))
          .value;
  Computed<String>? _$readmeComputed;

  @override
  String get readme =>
      (_$readmeComputed ??= Computed<String>(() => super.readme,
              name: '_DetailPackageViewModel.readme'))
          .value;
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_DetailPackageViewModel.hasData'))
      .value;
  Computed<bool>? _$hasReadmeComputed;

  @override
  bool get hasReadme =>
      (_$hasReadmeComputed ??= Computed<bool>(() => super.hasReadme,
              name: '_DetailPackageViewModel.hasReadme'))
          .value;
  Computed<bool>? _$loadingReadmeComputed;

  @override
  bool get loadingReadme =>
      (_$loadingReadmeComputed ??= Computed<bool>(() => super.loadingReadme,
              name: '_DetailPackageViewModel.loadingReadme'))
          .value;

  final _$_packageAtom = Atom(name: '_DetailPackageViewModel._package');

  @override
  Package? get _package {
    _$_packageAtom.reportRead();
    return super._package;
  }

  @override
  set _package(Package? value) {
    _$_packageAtom.reportWrite(value, super._package, () {
      super._package = value;
    });
  }

  final _$_versionAtom = Atom(name: '_DetailPackageViewModel._version');

  @override
  Version? get _version {
    _$_versionAtom.reportRead();
    return super._version;
  }

  @override
  set _version(Version? value) {
    _$_versionAtom.reportWrite(value, super._version, () {
      super._version = value;
    });
  }

  final _$_metricAtom = Atom(name: '_DetailPackageViewModel._metric');

  @override
  Metric get _metric {
    _$_metricAtom.reportRead();
    return super._metric;
  }

  @override
  set _metric(Metric value) {
    _$_metricAtom.reportWrite(value, super._metric, () {
      super._metric = value;
    });
  }

  final _$_readmeAtom = Atom(name: '_DetailPackageViewModel._readme');

  @override
  String get _readme {
    _$_readmeAtom.reportRead();
    return super._readme;
  }

  @override
  set _readme(String value) {
    _$_readmeAtom.reportWrite(value, super._readme, () {
      super._readme = value;
    });
  }

  final _$_loadingReadmeAtom =
      Atom(name: '_DetailPackageViewModel._loadingReadme');

  @override
  bool get _loadingReadme {
    _$_loadingReadmeAtom.reportRead();
    return super._loadingReadme;
  }

  @override
  set _loadingReadme(bool value) {
    _$_loadingReadmeAtom.reportWrite(value, super._loadingReadme, () {
      super._loadingReadme = value;
    });
  }

  final _$failureAtom = Atom(name: '_DetailPackageViewModel.failure');

  @override
  RequestFailure? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(RequestFailure? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_DetailPackageViewModel.load');

  @override
  Future<void> load(String namePackage, {bool refresh = false}) {
    return _$loadAsyncAction
        .run(() => super.load(namePackage, refresh: refresh));
  }

  final _$loadReadmeAsyncAction =
      AsyncAction('_DetailPackageViewModel.loadReadme');

  @override
  Future<void> loadReadme() {
    return _$loadReadmeAsyncAction.run(() => super.loadReadme());
  }

  final _$loadScoreAsyncAction =
      AsyncAction('_DetailPackageViewModel.loadScore');

  @override
  Future<void> loadScore() {
    return _$loadScoreAsyncAction.run(() => super.loadScore());
  }

  final _$_DetailPackageViewModelActionController =
      ActionController(name: '_DetailPackageViewModel');

  @override
  void setPackage(Package package) {
    final _$actionInfo = _$_DetailPackageViewModelActionController.startAction(
        name: '_DetailPackageViewModel.setPackage');
    try {
      return super.setPackage(package);
    } finally {
      _$_DetailPackageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVersion(Version version) {
    final _$actionInfo = _$_DetailPackageViewModelActionController.startAction(
        name: '_DetailPackageViewModel.setVersion');
    try {
      return super.setVersion(version);
    } finally {
      _$_DetailPackageViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
failure: ${failure},
hasError: ${hasError},
package: ${package},
score: ${score},
metric: ${metric},
version: ${version},
dependencies: ${dependencies},
dev_dependencies: ${dev_dependencies},
environment: ${environment},
readme: ${readme},
hasData: ${hasData},
hasReadme: ${hasReadme},
loadingReadme: ${loadingReadme}
    ''';
  }
}
