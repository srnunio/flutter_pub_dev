import 'package:flutter/material.dart';
import 'package:flutter_package/src/app.dart';
import 'package:flutter_package/src/application/settings/config_view_model.dart';
import 'package:flutter_package/src/infrastructure/core/network_builder.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var shared = await SharedPreferences.getInstance();

  final network = NetworkBuilder();

  InjectorConfig.initialize(dio: network.build(), preferences: shared);

  await inject<ConfigViewModel>().initialize();

  runApp(App());
}


