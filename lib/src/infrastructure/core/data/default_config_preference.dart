import 'package:flutter_package/src/domain/core/data/config_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultConfigDataPreference extends ConfigDataPreference {
  static const _keyLanguage = '_key_language';
  static const _keyDarkMode = '_keyDarkMode';

  DefaultConfigDataPreference(SharedPreferences preferences)
      : super(preferences);

  @override
  void enableDarkMode(bool value) => preferences.setBool(_keyDarkMode, value);

  @override
  void saveLanguageCode(String code) =>
      preferences.setString(_keyLanguage, code.trim().toLowerCase());

  @override
  void clear() {
    preferences.remove(_keyLanguage);
    preferences.remove(_keyDarkMode);
  }

  @override
  bool getIsActiveDarkMode() => preferences.getBool(_keyDarkMode) ?? false;

  @override
  String getCurrentLanguageCode() =>
      preferences.getString(_keyLanguage) ?? "";
}
