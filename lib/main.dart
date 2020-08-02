import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_package/view/styles.dart';

import 'core/utils/Translations.dart';
import 'core/utils/utils.dart';
import 'router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Translations.load(await Utils.defaultLocale());
  runApp(PubFlutter());
}

class PubFlutter extends StatelessWidget {
  var supportedLocales = <Locale>[
    const Locale('pt', 'PT'),
    const Locale('en', 'US'),
    Translations.current.currentLanguage
  ];

  var localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    const TranslationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: Styles.themeLight(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
