import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/core/api_service.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';

abstract class ISearchService extends ApiService {
  ISearchService(Dio dio) : super(dio);

  final String path = 'search';

  Future<Either<RequestFailure, List<String>>> searchPackage(
      {@required int page, @required String query});
}
