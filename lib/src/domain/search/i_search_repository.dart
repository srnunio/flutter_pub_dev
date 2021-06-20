import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'i_search_service.dart';

abstract class ISearchRepository {
  ISearchRepository(this.service) : assert(service != null);

  final ISearchService service;

  Future<Either<RequestFailure, List<String>>> searchPackage(
      {required int page, required String query});
}
