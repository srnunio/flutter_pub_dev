import 'package:dartz/dartz.dart'; 
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/entities/metric.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/packages/i_package_repository.dart';
import 'package:flutter_package/src/infrastructure/core/mapper.dart';
import 'package:mockito/mockito.dart';

import '../../data.dart';

class BasePackageRepositoryMock extends Mock implements IPackageRepository {
  @override
  Future<Either<RequestFailure, Metric>> getMetricPackage(
      {required String package}) {
    // TODO: implement getMetricPackage
    throw UnimplementedError();
  }

  @override
  Future<Either<RequestFailure, Package>> getPackageName(
      {required String namePackage}) async {
    try {
      var packages = List.from(DATA_FOR_TEST['packages'] as List<dynamic>)
          .map<Package>((data) {
        return Mapper.packageFromMap(data);
      }).toList();

      var index = packages.indexWhere((package) => package.name == namePackage);

      if (index >= 0) return Right(packages[index]);
    } catch (error) {}
    return left(RequestFailure.empty());
  }

  @override
  Future<Either<RequestFailure, List<Package>>> getPackages(
      {required int page}) async {
    try {
      var packages = List.from(DATA_FOR_TEST['packages'] as List<dynamic>)
          .map<Package>((data) {
        return Mapper.packageFromMap(data);
      }).toList();

      return (packages.isEmpty)
          ? Left(RequestFailure.empty())
          : Right(packages);
    } catch (error) {
      return left(RequestFailure.empty());
    }
  }
}
