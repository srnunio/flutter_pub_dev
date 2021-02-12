import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/core/api_service.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';

import 'entities/score.dart';

abstract class IPackageService extends ApiService {
  IPackageService(Dio dio) : super(dio);

  final String path = 'packages';

  Future<Either<RequestFailure, List<Package>>> getPackages({@required int page});

  Future<Either<RequestFailure, Package>> getPackageName({@required String namePackage});

  Future<Either<RequestFailure, Score>> getScorePackage({@required String namePackage});
}
