import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';

import 'entities/score.dart';

abstract class IPackageRepository {
  IPackageRepository(this.service) : assert(service != null);

  final IPackageService service;

  Future<Either<RequestFailure, Package>> getPackageName({required String namePackage});

  Future<Either<RequestFailure, List<Package>>> getPackages({required int page});

  Future<Either<RequestFailure, Score>> getScorePackage({required String namePackage});

}
