import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_package/src/presentation/settings/config_builder.dart';

import '../router.dart';
import 'application/settings/config_view_model.dart';
import 'domain/core/navigation/navigation_service.dart';
import 'injection/injection_config.dart';
import 'l18n.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConfigBuilder(
      builder: (locale, theme) {
        debugPrint("ConfigBuilder: $locale");
        return MaterialApp(
          navigatorKey: inject<NavigationService>().navigator,
          supportedLocales: <Locale>[
            Locale('pt', 'PT'),
            Locale('en', 'EN'),
            locale
          ],
          localizationsDelegates: const [
            const TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          localeResolutionCallback:
              (locale, Iterable<Locale> supportedLocales) {
            for (Locale supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode ||
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: theme,
          themeMode: theme.brightness == Brightness.light
              ? ThemeMode.light
              : ThemeMode.dark,
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
