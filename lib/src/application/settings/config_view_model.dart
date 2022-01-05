import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/domain/core/data/config_preference.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:mobx/mobx.dart';

import '../../l18n.dart';

part 'config_view_model.g.dart';

class ConfigViewModel = _ConfigViewModel with _$ConfigViewModel;

abstract class _ConfigViewModel extends BaseViewModel with Store {
  final ConfigDataPreference _preference;

  _ConfigViewModel(this._preference);

  @observable
  bool _darkModeIsEnable = false;

  @observable
  ThemeData? _themeData;

  @observable
  Locale? _locale;

  @computed
  Locale get locale => _locale!;

  @computed
  ThemeData get theme => _themeData!;

  @computed
  bool get darkModeIsEnable => _darkModeIsEnable;

  bool isCurrentLanguage(String code) =>
      _locale!.languageCode.trim().toLowerCase().contains(code);

  @action
  Future<void> initialize() async {
    setBusy(true);
    this._darkModeIsEnable = _preference.getIsActiveDarkMode();
    this._themeData = _darkModeIsEnable ? darkTheme() : lightTheme();
    var codeSaved = _preference.getCurrentLanguageCode();
    var deviceLocale = await Util.defaultLocale();
    var locale = (codeSaved.isEmpty) ? deviceLocale : Locale(codeSaved);
    this._locale = locale;
    await I18n.load(locale);
    setBusy(false);
  }

  @action
  Future<void> changeTranslate({required String languageCode}) async {
    setBusy(true);
    _preference.saveLanguageCode(languageCode);
    this._locale = Locale(languageCode);
    await I18n.load(this._locale!);
    await Future.delayed(Duration(milliseconds: 300));
    setBusy(false);
  }

  @action
  Future<void> enableDarkMode() async {
    setBusy(true);
    this._darkModeIsEnable = true;
    _preference.enableDarkMode(true);
    this._themeData = darkTheme();
    await Future.delayed(Duration(milliseconds: 300));
    setBusy(false);
  }

  @action
  Future<void> disableDarkMode() async {
    setBusy(true);
    this._darkModeIsEnable = false;
    _preference.enableDarkMode(false);
    this._themeData = lightTheme();
    await Future.delayed(Duration(milliseconds: 300));
    setBusy(false);
  }
}
