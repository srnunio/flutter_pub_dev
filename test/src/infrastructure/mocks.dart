import 'package:dio/dio.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/domain/search/i_search_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([IPackageRepository, ISearchRepository],
    customMocks: [MockSpec<Dio>(as: #MockApi)])
void main() {}
