import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/search/i_search_service.dart';
import 'package:flutter_package/src/infrastructure/search/base_search_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../mocks.mocks.dart';

void main() {
  late MockISearchRepository repository;
  late ISearchService service;

  setUp(() {
    repository = MockISearchRepository();
    service = BaseSearchService(repository);
  });

  test('when search is successfully', () async {
    var data = ['avatar_letter'];
    var query = 'avatar';
    when(repository.searchPackage(page: 0, query: query))
        .thenAnswer((_) async => Right(data));

    var result = await service.searchPackage(page: 0, query: query);

    expect(result, equals(Right(data)));
  });

  test('when search has empty result', () async {
    var query = 'avatar';
    when(repository.searchPackage(page: 0, query: query))
        .thenAnswer((_) async => Left(RequestFailure.empty()));

    var result = await service.searchPackage(page: 0, query: query);

    expect(result, equals(Left(RequestFailure.empty())));
  });
}
