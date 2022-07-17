import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';

import 'i_search_repository.dart';

abstract class ISearchService {
  ISearchService(this.repository);

  final ISearchRepository repository;

  /// [searchPackage] Method responsible for searching packages
  /// This returns list of package names when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, List<String>>> searchPackage(
      {required int page, required String query});
}


