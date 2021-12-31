import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_package/src/domain/core/api_service.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';

abstract class ISearchService extends ApiService {
  ISearchService(Dio dio) : super(dio);

  final String path = '/search';

  /// [searchPackage] Method responsible for searching packages
  /// This returns list of package names when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, List<String>>> searchPackage(
      {required int page, required String query});
}
