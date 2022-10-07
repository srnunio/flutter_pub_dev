import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_package/src/domain/packages/entities/metric.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';

import '../core/api_service.dart';

abstract class IPackageRepository extends Api {
  IPackageRepository(Dio dio) : super(dio);

  final String path = '/packages';

  /// [getPackages] method responsible for listing the packages
  /// This returns a list of packets [List<Package>] when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, List<Package>>> getPackages(
      {required int page});

  /// [getPublisher] get publisher of package [packageName]
  /// This return String when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, String>> getPublisher(
      {required String packageName});

  /// [getPackageName] This method searches for a package by name
  /// This return [Package] when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, Package>> getPackageName(
      {required String packageName});

  /// [getMetricPackage] This method gets the metrics of a package
  /// This return [Metric] when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, Metric>> getMetricPackage(
      {required String package});
}


