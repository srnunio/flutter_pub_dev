// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PackagesViewModel on _PackagesViewModel, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_PackagesViewModel.hasError'))
          .value;
  Computed<RequestFailure>? _$failureComputed;

  @override
  RequestFailure get failure =>
      (_$failureComputed ??= Computed<RequestFailure>(() => super.failure,
              name: '_PackagesViewModel.failure'))
          .value;
  Computed<List<Package>>? _$packagesComputed;

  @override
  List<Package> get packages =>
      (_$packagesComputed ??= Computed<List<Package>>(() => super.packages,
              name: '_PackagesViewModel.packages'))
          .value;
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: '_PackagesViewModel.hasData'))
      .value;

  final _$_packagesAtom = Atom(name: '_PackagesViewModel._packages');

  @override
  ObservableList<Package> get _packages {
    _$_packagesAtom.reportRead();
    return super._packages;
  }

  @override
  set _packages(ObservableList<Package> value) {
    _$_packagesAtom.reportWrite(value, super._packages, () {
      super._packages = value;
    });
  }

  final _$_failureAtom = Atom(name: '_PackagesViewModel._failure');

  @override
  RequestFailure? get _failure {
    _$_failureAtom.reportRead();
    return super._failure;
  }

  @override
  set _failure(RequestFailure? value) {
    _$_failureAtom.reportWrite(value, super._failure, () {
      super._failure = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_PackagesViewModel.load');

  @override
  Future<bool> load({bool refresh = false}) {
    return _$loadAsyncAction.run(() => super.load(refresh: refresh));
  }

  final _$_PackagesViewModelActionController =
      ActionController(name: '_PackagesViewModel');

  @override
  void _setData(List<Package> list, bool refresh) {
    final _$actionInfo = _$_PackagesViewModelActionController.startAction(
        name: '_PackagesViewModel._setData');
    try {
      return super._setData(list, refresh);
    } finally {
      _$_PackagesViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasError: ${hasError},
failure: ${failure},
packages: ${packages},
hasData: ${hasData}
    ''';
  }
}
