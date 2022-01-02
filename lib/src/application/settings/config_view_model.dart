import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/utils/theme.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:mobx/mobx.dart';

import '../../l18n.dart';

part 'config_view_model.g.dart';

class ConfigViewModel = _ConfigViewModel with _$ConfigViewModel;

abstract class _ConfigViewModel extends BaseViewModel with Store {
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
  String get languageCode => _locale!.languageCode;

  @computed
  bool get darkModeIsEnable => _darkModeIsEnable;

  bool isCurrentLanguage(String code) => (_locale!.languageCode.contains(code));

  @action
  Future<void> initialize() async {
    this._locale = await Util.defaultLocale();
    await I18n.load(this._locale!);
    this._themeData = lightTheme();
  }

  @action
  Future<void> changeTranslate({required String languageCode}) async {
    setBusy(true);
    this._locale = Locale(languageCode);
    await I18n.load(this._locale!);
    await Future.delayed(Duration(milliseconds: 300));
    setBusy(false);
  }

  @action
  Future<void> enableDarkMode() async {
    setBusy(true);
    this._darkModeIsEnable = false;
    this._themeData = darkTheme();
    await Future.delayed(Duration(milliseconds: 300));
    setBusy(false);
  }

  @action
  Future<void> disableDarkMode() async {
    setBusy(true);
    this._darkModeIsEnable = true;
    this._themeData = lightTheme();
    await Future.delayed(Duration(milliseconds: 300));
    setBusy(false);
  }
}
