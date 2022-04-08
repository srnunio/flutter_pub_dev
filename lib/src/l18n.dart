import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class I18n {
  static late Map<dynamic, dynamic> _localizedValues;

  static late I18n _current;

  static I18n get instance => _current;

  static String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static String key(String text) {
    var value =
        _localizedValues.entries.firstWhere((element) => element.value == text);
    return value.key;
  }

  static Future<I18n> load(Locale locale) async {
    var _filteredLocale = _filterLocale(locale);
    var file = "assets/locale/i18n_${_filteredLocale.languageCode}.json";
    String jsonContent = await rootBundle.loadString(file);
    _localizedValues = json.decode(jsonContent);
    return _current = I18n();
  }

  static Locale filterLocale(Locale locale) => _filterLocale(locale);

  static Locale _filterLocale(Locale locale) {
    if (locale.languageCode.toLowerCase().contains('pt')) return Locale('pt');
    if (locale.languageCode.toLowerCase().contains('en')) return Locale('en');
    if (locale.languageCode.toLowerCase().contains('zh')) return Locale('zh');
    return Locale('pt');
  }

  bool isSupported(Locale locale) => ['en', 'pt', 'zh'].contains(locale.languageCode);
}

class TranslationsDelegate extends LocalizationsDelegate<I18n> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt', 'zh'].contains(locale.languageCode);

  @override
  Future<I18n> load(Locale locale) async {
    return I18n.instance;
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}

extension Str on String {
  String get translate => I18n.text(this);
}
