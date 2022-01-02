import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/application/settings/config_view_model.dart';
import 'package:flutter_package/src/domain/core/data/config_preference.dart';
import 'package:flutter_package/src/domain/core/i_advanced_service.dart';
import 'package:flutter_package/src/domain/core/navigation/navigation_service.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/domain/search/i_search_repository.dart';
import 'package:flutter_package/src/domain/search/i_search_service.dart';
import 'package:flutter_package/src/infrastructure/core/data/default_config_preference.dart';
import 'package:flutter_package/src/infrastructure/core/default_advanced_service.dart';
import 'package:flutter_package/src/infrastructure/core/navigation/default_navigation_service.dart';
import 'package:flutter_package/src/infrastructure/packages/package_repository.dart';
import 'package:flutter_package/src/infrastructure/packages/package_service.dart';
import 'package:flutter_package/src/infrastructure/search/search_repository.dart';
import 'package:flutter_package/src/infrastructure/search/search_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

T inject<T extends Object>() => InjectorConfig.getInstance().get<T>();

final _injector = GetIt.instance;

class InjectorConfig {
  InjectorConfig._(this._dio, this._preferences) {
    registerServices();
    registerPreferences();
    registerRepositories();
    registerViewModels();
  }

  factory InjectorConfig.initialize(
          {required Dio dio, required SharedPreferences preferences}) =>
      InjectorConfig._(dio, preferences);

  final Dio _dio;
  final SharedPreferences _preferences;

  static GetIt getInstance() => _injector;

  void registerServices() {
    _injector.registerLazySingleton<NavigationService>(
        () => DefaultNavigationService(GlobalKey<NavigatorState>()));

    _injector.registerFactory<IPackageService>(() => PackageService(_dio));
    _injector.registerFactory<ISearchService>(() => SearchService(_dio));

    _injector.registerFactory<IAdvancedService>(() => DefaultAdvancedService());
  }

  void registerPreferences() {
    _injector.registerLazySingleton<ConfigDataPreference>(
        () => DefaultConfigDataPreference(_preferences));
  }

  void registerRepositories() {
    _injector.registerFactory<IPackageRepository>(
        () => PackageRepository(_injector.get<IPackageService>()));

    _injector.registerFactory<ISearchRepository>(
        () => SearchRepository(_injector.get<ISearchService>()));
  }

  void registerViewModels() {
    _injector.registerLazySingleton(
        () => ConfigViewModel(_injector.get<ConfigDataPreference>()));
  }
}
