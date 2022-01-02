import 'package:shared_preferences/shared_preferences.dart';

abstract class ConfigDataPreference {
  final SharedPreferences preferences;

  const ConfigDataPreference(this.preferences);

  /// save preference the language
  void saveLanguageCode(String code);

  /// save preference the theme mode
  void enableDarkMode(bool value);

  /// clear preferences
  void clear();

  bool getIsActiveDarkMode();

  String getCurrentLanguageCode();
}
