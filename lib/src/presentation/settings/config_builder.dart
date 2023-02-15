
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/application/settings/config_view_model.dart';
import 'package:flutter_package/src/injection/injection_config.dart';

class ConfigBuilder extends StatefulWidget {
  final Widget Function(Locale,ThemeData) builder;

  ConfigBuilder({required this.builder});

  @override
  _ConfigBuilderState createState() => _ConfigBuilderState();
}

class _ConfigBuilderState extends State<ConfigBuilder>
    with SingleTickerProviderStateMixin {
  ConfigViewModel _model = inject<ConfigViewModel>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => widget.builder(_model.locale,_model.theme),
    );
  }
}
