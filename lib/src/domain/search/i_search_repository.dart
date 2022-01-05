import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'i_search_service.dart';

abstract class ISearchRepository {
  ISearchRepository(this.service);

  final ISearchService service;

  /// [searchPackage] Method responsible for searching packages
  /// This returns list of package names when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, List<String>>> searchPackage(
      {required int page, required String query});
}
