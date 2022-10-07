import 'package:dartz/dartz.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';

abstract class IAdvancedService {
  /// [readFile]  Responsible for reading the project readme file
  /// This return [String] when the request is successful
  /// and [RequestFailure] when the request is not successful
  Future<Either<RequestFailure, String>> readFile({required String gitPath,required String fileName});
}
