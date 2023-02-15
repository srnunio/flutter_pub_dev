// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchViewModel on _SearchViewModel, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_SearchViewModel.hasError'))
          .value;
  Computed<List<String>>? _$resultsComputed;

  @override
  List<String> get results =>
      (_$resultsComputed ??= Computed<List<String>>(() => super.results,
              name: '_SearchViewModel.results'))
          .value;
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??=
          Computed<bool>(() => super.hasData, name: '_SearchViewModel.hasData'))
      .value;

  late final _$_resultsAtom =
      Atom(name: '_SearchViewModel._results', context: context);

  @override
  ObservableList<String> get _results {
    _$_resultsAtom.reportRead();
    return super._results;
  }

  @override
  set _results(ObservableList<String> value) {
    _$_resultsAtom.reportWrite(value, super._results, () {
      super._results = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_SearchViewModel.failure', context: context);

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
      AsyncAction('_SearchViewModel.load', context: context);

  @override
  Future<void> load({required String query, bool refresh = false}) {
    return _$loadAsyncAction
        .run(() => super.load(query: query, refresh: refresh));
  }

  late final _$_SearchViewModelActionController =
      ActionController(name: '_SearchViewModel', context: context);

  @override
  void setData(List<String> list, bool refresh) {
    final _$actionInfo = _$_SearchViewModelActionController.startAction(
        name: '_SearchViewModel.setData');
    try {
      return super.setData(list, refresh);
    } finally {
      _$_SearchViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clear() {
    final _$actionInfo = _$_SearchViewModelActionController.startAction(
        name: '_SearchViewModel.clear');
    try {
      return super.clear();
    } finally {
      _$_SearchViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
failure: ${failure},
hasError: ${hasError},
results: ${results},
hasData: ${hasData}
    ''';
  }
}
