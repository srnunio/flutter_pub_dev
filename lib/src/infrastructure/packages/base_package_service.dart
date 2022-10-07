import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/packages/entities/metric.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';

class BasePackageService extends IPackageService {
  BasePackageService(IPackageRepository repository) : super(repository);

  @override
  Future<Either<RequestFailure, Package>> getPackageName(
          {required String packageName}) async =>
      await repository.getPackageName(packageName: packageName);

  @override
  Future<Either<RequestFailure, List<Package>>> getPackages(
          {required int page}) async =>
      await repository.getPackages(page: page);

  @override
  Future<Either<RequestFailure, Metric>> getMetricPackage(
          {required String package}) async =>
      await repository.getMetricPackage(package: package);

  @override
  Future<Either<RequestFailure, String>> getPublisher(
          {required String packageName}) async =>
      await repository.getPublisher(packageName: packageName);
}
