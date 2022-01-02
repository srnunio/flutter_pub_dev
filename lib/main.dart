import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_package/src/application/settings/config_view_model.dart';
import 'package:flutter_package/src/domain/core/navigation/navigation_service.dart';
import 'package:flutter_package/src/infrastructure/core/network_builder.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/l18n.dart';
import 'package:flutter_package/src/presentation/settings/config_builder.dart';
import 'router.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await I18n.load(await Util.defaultLocale());
  final network = NetworkBuilder();
  InjectorConfig.init(network.build());
  await inject<ConfigViewModel>().initialize();
  runApp(PubFlutter());
}

class PubFlutter extends StatelessWidget {
  var localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    const I18nDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];

  @override
  Widget build(BuildContext context) {
    return ConfigBuilder(
      builder: (locale, theme) {
        return MaterialApp(
          navigatorKey: inject<NavigationService>().navigator,
          supportedLocales: <Locale>[
            const Locale('pt', 'PT'),
            const Locale('en', 'EN'),
            locale
          ],
          localizationsDelegates: localizationsDelegates,
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
