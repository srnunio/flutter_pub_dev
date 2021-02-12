import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_package/src/domain/core/navigation/navigation_service.dart';
import 'package:flutter_package/src/infrastructure/core/network_builder.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/l18n.dart';
import 'router.dart';
import 'src/utils/theme.dart';
import 'src/utils/util.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await I18n.load(await Util.defaultLocale());
  final network = NetworkBuilder();
  InjectorConfig.init(network.build());
  runApp(PubFlutter());
}

class PubFlutter extends StatelessWidget {
  var supportedLocales = <Locale>[
    const Locale('pt', 'PT'),
    const Locale('en', 'EN'),
    I18n.instance.currentLanguage
  ];

  var localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    const I18nDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: inject<NavigationService>().navigator,
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
      theme: CustomTheme.themeBuild(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
