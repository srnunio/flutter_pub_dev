import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/search/i_search_service.dart';

import '../../domain/search/i_search_repository.dart';

class BaseSearchService extends ISearchService {
  BaseSearchService(ISearchRepository repository) : super(repository);

  @override
  Future<Either<RequestFailure, List<String>>> searchPackage(
          {required int page, required String query}) async =>
      await repository.searchPackage(page: page, query: query);
}
