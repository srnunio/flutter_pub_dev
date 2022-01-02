// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigViewModel on _ConfigViewModel, Store {
  Computed<Locale>? _$localeComputed;

  @override
  Locale get locale => (_$localeComputed ??=
          Computed<Locale>(() => super.locale, name: '_ConfigViewModel.locale'))
      .value;
  Computed<String>? _$languageCodeComputed;

  @override
  String get languageCode =>
      (_$languageCodeComputed ??= Computed<String>(() => super.languageCode,
              name: '_ConfigViewModel.languageCode'))
          .value;

  final _$_localeAtom = Atom(name: '_ConfigViewModel._locale');

  @override
  Locale? get _locale {
    _$_localeAtom.reportRead();
    return super._locale;
  }

  @override
  set _locale(Locale? value) {
    _$_localeAtom.reportWrite(value, super._locale, () {
      super._locale = value;
    });
  }

  final _$initializeAsyncAction = AsyncAction('_ConfigViewModel.initialize');

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  final _$changeTranslateAsyncAction =
      AsyncAction('_ConfigViewModel.changeTranslate');

  @override
  Future<void> changeTranslate({required String languageCode}) {
    return _$changeTranslateAsyncAction
        .run(() => super.changeTranslate(languageCode: languageCode));
  }

  @override
  String toString() {
    return '''
locale: ${locale},
languageCode: ${languageCode}
    ''';
  }
}
