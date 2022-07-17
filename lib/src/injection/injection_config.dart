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
import 'package:flutter_package/src/infrastructure/packages/base_package_service.dart';
import 'package:flutter_package/src/infrastructure/search/base_search_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../application/packages/detail_package_view_model.dart';
import '../application/packages/packages_view_model.dart';
import '../application/search/search_view_model.dart';
import '../infrastructure/packages/base_package_repository.dart';
import '../infrastructure/search/base_search_service.dart';

T inject<T extends Object>() => InjectorConfig.getInstance().get<T>();

final _injector = GetIt.instance;

class InjectorConfig {
  InjectorConfig._(this._dio, this._preferences) {
    registerPreferences();
    registerRepositories();
    registerServices();
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

    _injector.registerFactory<IPackageService>(
        () => BasePackageService(_injector.get<IPackageRepository>()));

    _injector.registerFactory<ISearchService>(
        () => BaseSearchService(_injector.get<ISearchRepository>()));

    _injector.registerFactory<IAdvancedService>(() => DefaultAdvancedService());
  }

  void registerPreferences() {
    _injector.registerLazySingleton<ConfigDataPreference>(
        () => DefaultConfigDataPreference(_preferences));
  }

  void registerRepositories() {
    _injector
        .registerFactory<IPackageRepository>(() => BasePackageRepository(_dio));

    _injector
        .registerFactory<ISearchRepository>(() => BaseSearchRepository(_dio));
  }

  void registerViewModels() {
    _injector.registerLazySingleton(
        () => ConfigViewModel(_injector.get<ConfigDataPreference>()));

    _injector.registerFactory(
        () => SearchViewModel(_injector.get<ISearchService>()));

    _injector.registerFactory(() => DetailPackageViewModel(
        _injector.get<IPackageService>(), _injector.get<IAdvancedService>()));

    _injector.registerFactory(
        () => PackagesViewModel(_injector.get<IPackageService>()));
  }
}
