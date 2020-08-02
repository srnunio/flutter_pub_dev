import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translations {
  Translations(Locale locale) {
    _Translations = this;
    this.locale = locale;
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static Translations current;

  static Translations of(BuildContext context) {
    var result = Localizations.of<Translations>(context, Translations);
    print('Translations Result => ${result}');
    return result;
  }

  Translations _Translations;

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  Future<Translations> run() async {
    print('Code Run => ${"assets/locale/i18n_${locale.languageCode}.json"}');
    Translations translations = new Translations(locale);
    String jsonContent = await rootBundle
        .loadString("assets/locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  static Locale filterLocale(Locale locale) {
    if (locale.languageCode.contains('pt')) {
      return Locale('pt');
    } else if (locale.languageCode.contains('en')) {
      return Locale('en');
    }
    else {
      return Locale('en');
    }
  }

  static bool isSupported(Locale locale) =>
      ['en', 'pt'].contains(locale.languageCode);

  static Future<Translations> load(Locale locale) async {
    locale = filterLocale(locale);
    Translations translations = new Translations(locale);

    String jsonContent = await rootBundle
        .loadString("assets/locale/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    current = translations;
    return translations;
  }

  get currentLanguage => filterLocale(locale);
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<Translations> load(Locale locale) async {
    Translations translations = new Translations(locale);
    await translations.run();
    return translations;
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
