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
  Computed<ThemeData>? _$themeComputed;

  @override
  ThemeData get theme =>
      (_$themeComputed ??= Computed<ThemeData>(() => super.theme,
              name: '_ConfigViewModel.theme'))
          .value;
  Computed<String>? _$languageCodeComputed;

  @override
  String get languageCode =>
      (_$languageCodeComputed ??= Computed<String>(() => super.languageCode,
              name: '_ConfigViewModel.languageCode'))
          .value;
  Computed<bool>? _$darkModeIsEnableComputed;

  @override
  bool get darkModeIsEnable => (_$darkModeIsEnableComputed ??= Computed<bool>(
          () => super.darkModeIsEnable,
          name: '_ConfigViewModel.darkModeIsEnable'))
      .value;

  final _$_darkModeIsEnableAtom =
      Atom(name: '_ConfigViewModel._darkModeIsEnable');

  @override
  bool get _darkModeIsEnable {
    _$_darkModeIsEnableAtom.reportRead();
    return super._darkModeIsEnable;
  }

  @override
  set _darkModeIsEnable(bool value) {
    _$_darkModeIsEnableAtom.reportWrite(value, super._darkModeIsEnable, () {
      super._darkModeIsEnable = value;
    });
  }

  final _$_themeDataAtom = Atom(name: '_ConfigViewModel._themeData');

  @override
  ThemeData? get _themeData {
    _$_themeDataAtom.reportRead();
    return super._themeData;
  }

  @override
  set _themeData(ThemeData? value) {
    _$_themeDataAtom.reportWrite(value, super._themeData, () {
      super._themeData = value;
    });
  }

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

  final _$enableDarkModeAsyncAction =
      AsyncAction('_ConfigViewModel.enableDarkMode');

  @override
  Future<void> enableDarkMode() {
    return _$enableDarkModeAsyncAction.run(() => super.enableDarkMode());
  }

  final _$disableDarkModeAsyncAction =
      AsyncAction('_ConfigViewModel.disableDarkMode');

  @override
  Future<void> disableDarkMode() {
    return _$disableDarkModeAsyncAction.run(() => super.disableDarkMode());
  }

  @override
  String toString() {
    return '''
locale: ${locale},
theme: ${theme},
languageCode: ${languageCode},
darkModeIsEnable: ${darkModeIsEnable}
    ''';
  }
}
