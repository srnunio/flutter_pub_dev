import 'package:flutter/cupertino.dart';
import 'package:flutter_package/src/application/core/base_view_model.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:mobx/mobx.dart';

import '../../l18n.dart';

part 'config_view_model.g.dart';

class ConfigViewModel = _ConfigViewModel with _$ConfigViewModel;

abstract class _ConfigViewModel extends BaseViewModel with Store {
  @observable
  Locale? _locale;

  @computed
  Locale get locale => _locale!;

  @computed
  String get languageCode => _locale!.languageCode;

  bool isCurrentLanguage(String code) => (_locale!.languageCode.contains(code));

  @action
  Future<void> initialize() async {
    this._locale = await Util.defaultLocale();
    await I18n.load(this._locale!);
  }

  @action
  Future<void> changeTranslate({required String languageCode}) async {
    setBusy(true);
    this._locale = Locale(languageCode);
    await I18n.load(this._locale!);
    await Future.delayed(Duration(milliseconds: 300));
    setBusy(false);
  }
}
