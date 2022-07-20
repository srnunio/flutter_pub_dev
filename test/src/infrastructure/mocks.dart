import 'package:dio/dio.dart';
import 'package:flutter_package/src/domain/core/i_advanced_service.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/domain/search/i_search_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([IPackageRepository, ISearchRepository, IAdvancedService],
    customMocks: [MockSpec<Dio>(as: #MockApi)])
void main() {}
