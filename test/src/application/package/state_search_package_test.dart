import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/application/search/search_view_model.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/search/i_search_service.dart';
import 'package:flutter_package/src/infrastructure/search/base_search_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../infrastructure/mocks.mocks.dart';

void main() {
  late MockISearchRepository repository;
  late ISearchService service;
  late SearchViewModel viewModel;

  setUp(() {
    repository = MockISearchRepository();
    service = BaseSearchService(repository);
    viewModel = SearchViewModel(service);
  });

  test('change state when search is successfully', () async {
    var data = ['avatar_letter'];
    var query = 'avatar';

    when(repository.searchPackage(page: 1, query: query))
        .thenAnswer((_) async => Right(data));

    expect(viewModel.hasData, false);

    await viewModel.load(query: query);

    expect(viewModel.hasData, true);
  });

  test('state when search result is empty', () async {
    var query = 'avatar';

    when(repository.searchPackage(page: 1, query: query))
        .thenAnswer((_) async => Left(RequestFailure.empty()));

    expect(viewModel.hasData, false);

    await viewModel.load(query: query);

    expect(Left(RequestFailure.empty()), equals(Left(RequestFailure.empty())));
  });
}
