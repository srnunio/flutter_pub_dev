import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_package/src/application/settings/config_view_model.dart';
import 'package:flutter_package/src/injection/injection_config.dart';
import 'package:flutter_package/src/presentation/core/custom_switch.dart';
import 'package:flutter_package/src/presentation/core/styles.dart';
import 'package:flutter_package/src/presentation/core/title_switch.dart';
import 'package:flutter_package/src/presentation/settings/config_builder.dart';
import 'package:flutter_package/src/utils/colors.dart';
import 'package:flutter_package/src/utils/size.dart';
import 'package:flutter_package/src/presentation/core/svg_icon.dart';
import 'package:flutter_package/src/utils/util.dart';
import 'package:flutter_package/src/l18n.dart';
import '../../utils/constants.dart';

class SettingScreen extends StatefulWidget {
  static const route = '/settings_screen';

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingScreen>
    with SingleTickerProviderStateMixin {
  ConfigViewModel _model = inject<ConfigViewModel>();

  CustomSwitchController _switchPTController =
      CustomSwitchController(initialValue: true);
  CustomSwitchController _switchENController = CustomSwitchController();
  CustomSwitchController _switchZHController = CustomSwitchController();

  CustomSwitchController _switchThemeController = CustomSwitchController();

  /// see github
  onGoGit() => Util.openLink(url: GITHUB);

  /// see website
  onGoWebsite() => Util.openLink(url: PUBDEV);

  /// [onTapPT] run pt translate
  onTapPT(bool value) {
    debugPrint("onTapPT: $value");
    _model.changeTranslate(languageCode: 'pt');
    _switchPTController.enable();
    _switchZHController.disable();
    _switchENController.disable();
  }

  /// [onTapEN] run en translate
  onTapEN(bool value) {
    _model.changeTranslate(languageCode: 'en');
    _switchENController.enable();
    _switchZHController.disable();
    _switchPTController.disable();
  }

  /// [onTapZH] run zh translate
  onTapZH(bool value) {
    _model.changeTranslate(languageCode: 'zh');
    _switchZHController.enable();
    _switchPTController.disable();
    _switchENController.disable();
  }

  /// [onTheme] run theme
  onTheme() {
    if (_model.theme.brightness == Brightness.light) {
      _switchThemeController.enable();
      _model.enableDarkMode();
    } else {
      _switchThemeController.disable();
      _model.disableDarkMode();
    }
  }

  /// custom action
  _bodyMoreItem({required Function() onTap, required String iconName}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: decoration(borderRadius: kBorder),
        child: CustomIcon(icon: iconName),
      ),
    );
  }

  /// viewing language
  _bodyLanguage() {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        decoration: decoration(borderRadius: kBorder),
        child: ExpansionTile(
          initiallyExpanded: true,
          tilePadding: EdgeInsets.zero,
          title: Container(
            width: double.infinity,
            child: Text(
              "language".translate,
              style: styleText(fontWeight: FontWeight.bold),
            ),
          ),
          children: [
            TitleSwitch(
                title: 'portuguese'.translate,
                controller: _switchPTController,
                onTap: onTapPT),
            verticalSpace(16.0),
            TitleSwitch(
                title: 'english'.translate,
                controller: _switchENController,
                onTap: onTapEN),
            verticalSpace(16.0),
            TitleSwitch(
                title: 'china'.translate,
                controller: _switchZHController,
                onTap: onTapZH),
            verticalSpace(16.0),
          ],
        ),
      );
    });
  }

  /// viewing language
  _bodyTheme() {
    return Observer(builder: (_) {
      return Container(
        padding: EdgeInsets.all(16.0),
        decoration: decoration(borderRadius: kBorder),
        child: TitleSwitch(
            title: 'dark_mode'.translate,
            controller: _switchThemeController,
            onTap: (_) => onTheme()),
      );
    });
  }

  /// run configs
  _initialize() {
    if (_model.isCurrentLanguage('pt')) {
      _switchPTController.enable();
      _switchZHController.disable();
      _switchENController.disable();
    } else if (_model.isCurrentLanguage('en')) {
      _switchENController.enable();
      _switchZHController.disable();
      _switchPTController.disable();
    } else if (_model.isCurrentLanguage('zh')) {
      _switchZHController.enable();
      _switchENController.disable();
      _switchPTController.disable();
    }

    if (_model.darkModeIsEnable) {
      _switchThemeController.enable();
    } else {
      _switchThemeController.disable();
    }
  }

  _bodyDescriptionApp() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/dartlogo.png',
            width: 80.0,
            height: 80.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'app'.translate,
          textAlign: TextAlign.center,
          style: styleText(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        Text(
          'v$VERSION_APP',
          textAlign: TextAlign.center,
          style: styleText(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: kSubtitleTextColor),
        ),
        Text(
          'app_desc'.translate,
          textAlign: TextAlign.center,
          style: styleText(color: kSubtitleTextColor, fontSize: 14.0),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ConfigBuilder(builder: (_, theme) {
        return Scaffold(
          body: SafeArea(
              child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: theme.backgroundColor,
              title: Text(
                'settings'.translate,
                style: styleText(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _bodyDescriptionApp(),
                    verticalSpaceMedium(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _bodyMoreItem(onTap: onGoWebsite, iconName: 'globe'),
                        horizontalSpaceSmall(),
                        _bodyMoreItem(onTap: onGoGit, iconName: 'github'),
                      ],
                    ),
                    Divider(
                      color: kPlaceholderColor,
                    ),
                    verticalSpaceMedium(),
                    _bodyLanguage(),
                    verticalSpaceMedium(),
                    _bodyTheme(),
                    verticalSpaceMedium(),
                  ],
                ),
              ),
            ),
          )),
        );
      });
    });
  }
}
