// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_package_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

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
  List<Dependency> get devDependencies => (_$dev_dependenciesComputed ??=
          Computed<List<Dependency>>(() => super.devDependencies,
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
  Computed<String>? _$changelogComputed;

  @override
  String get changelog =>
      (_$changelogComputed ??= Computed<String>(() => super.changelog,
              name: '_DetailPackageViewModel.changelog'))
          .value;
  Computed<String>? _$publisherComputed;

  @override
  String get publisher =>
      (_$publisherComputed ??= Computed<String>(() => super.publisher,
              name: '_DetailPackageViewModel.publisher'))
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
  Computed<bool>? _$hasChangelogComputed;

  @override
  bool get hasChangelog =>
      (_$hasChangelogComputed ??= Computed<bool>(() => super.hasChangelog,
              name: '_DetailPackageViewModel.hasChangelog'))
          .value;
  Computed<bool>? _$loadingReadmeComputed;

  @override
  bool get loadingReadme =>
      (_$loadingReadmeComputed ??= Computed<bool>(() => super.loadingReadme,
              name: '_DetailPackageViewModel.loadingReadme'))
          .value;
  Computed<bool>? _$loadingChangelogComputed;

  @override
  bool get loadingChangelog => (_$loadingChangelogComputed ??= Computed<bool>(
          () => super.loadingChangelog,
          name: '_DetailPackageViewModel.loadingChangelog'))
      .value;

  late final _$_packageAtom =
      Atom(name: '_DetailPackageViewModel._package', context: context);

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

  late final _$_versionAtom =
      Atom(name: '_DetailPackageViewModel._version', context: context);

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

  late final _$_metricAtom =
      Atom(name: '_DetailPackageViewModel._metric', context: context);

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

  late final _$_readmeAtom =
      Atom(name: '_DetailPackageViewModel._readme', context: context);

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

  late final _$_publisherAtom =
      Atom(name: '_DetailPackageViewModel._publisher', context: context);

  @override
  String get _publisher {
    _$_publisherAtom.reportRead();
    return super._publisher;
  }

  @override
  set _publisher(String value) {
    _$_publisherAtom.reportWrite(value, super._publisher, () {
      super._publisher = value;
    });
  }

  late final _$_changelogAtom =
      Atom(name: '_DetailPackageViewModel._changelog', context: context);

  @override
  String get _changelog {
    _$_changelogAtom.reportRead();
    return super._changelog;
  }

  @override
  set _changelog(String value) {
    _$_changelogAtom.reportWrite(value, super._changelog, () {
      super._changelog = value;
    });
  }

  late final _$_loadingReadmeAtom =
      Atom(name: '_DetailPackageViewModel._loadingReadme', context: context);

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

  late final _$_loadingChangelogAtom =
      Atom(name: '_DetailPackageViewModel._loadingChangelog', context: context);

  @override
  bool get _loadingChangelog {
    _$_loadingChangelogAtom.reportRead();
    return super._loadingChangelog;
  }

  @override
  set _loadingChangelog(bool value) {
    _$_loadingChangelogAtom.reportWrite(value, super._loadingChangelog, () {
      super._loadingChangelog = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_DetailPackageViewModel.failure', context: context);

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

  late final _$loadAsyncAction =
      AsyncAction('_DetailPackageViewModel.load', context: context);

  @override
  Future<void> load(String packageName, {bool refresh = false}) {
    return _$loadAsyncAction
        .run(() => super.load(packageName, refresh: refresh));
  }

  late final _$loadPublisherAsyncAction =
      AsyncAction('_DetailPackageViewModel.loadPublisher', context: context);

  @override
  Future<void> loadPublisher(String namePackage) {
    return _$loadPublisherAsyncAction
        .run(() => super.loadPublisher(namePackage));
  }

  late final _$loadReadmeAsyncAction =
      AsyncAction('_DetailPackageViewModel.loadReadme', context: context);

  @override
  Future<void> loadReadme() {
    return _$loadReadmeAsyncAction.run(() => super.loadReadme());
  }

  late final _$loadChangelogAsyncAction =
      AsyncAction('_DetailPackageViewModel.loadChangelog', context: context);

  @override
  Future<void> loadChangelog() {
    return _$loadChangelogAsyncAction.run(() => super.loadChangelog());
  }

  late final _$loadScoreAsyncAction =
      AsyncAction('_DetailPackageViewModel.loadScore', context: context);

  @override
  Future<void> loadScore() {
    return _$loadScoreAsyncAction.run(() => super.loadScore());
  }

  late final _$_DetailPackageViewModelActionController =
      ActionController(name: '_DetailPackageViewModel', context: context);

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
dev_dependencies: ${devDependencies},
environment: ${environment},
readme: ${readme},
changelog: ${changelog},
publisher: ${publisher},
hasData: ${hasData},
hasReadme: ${hasReadme},
hasChangelog: ${hasChangelog},
loadingReadme: ${loadingReadme},
loadingChangelog: ${loadingChangelog}
    ''';
  }
}
