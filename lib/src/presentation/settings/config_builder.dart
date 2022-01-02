import 'package:customized/customized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/application/settings/config_view_model.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/theme.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:flutter_package/src/l18n.dart';
import '../../utils/constants.dart';
import '../../utils/size.dart';

class ConfigBuilder extends StatefulWidget {
  final Widget Function(Locale) builder;

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
      builder: (_) => widget.builder(_model.locale),
    );
  }
}
