import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';

abstract class IAdvancedService {
  Future<Either<RequestFailure, String>> getReadme({@required String gitPath});
}
