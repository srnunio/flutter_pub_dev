import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_package/src/domain/packages/entities/metric.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/infrastructure/core/mapper.dart';

import '../../domain/packages/i_package_repository.dart';

class BasePackageRepository extends IPackageRepository {
  BasePackageRepository(Dio dio) : super(dio);

  @override
  Future<Either<RequestFailure, List<Package>>> getPackages(
      {required int page}) async {
    try {
      final response = await dio.get('$path?page=$page',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var packages = List.from(response.data['packages']).map<Package>((data) {
        return Mapper.packageFromMap(data);
      }).toList();

      return (packages.isEmpty)
          ? Left(RequestFailure.empty())
          : Right(packages);
    } on DioError catch (e) {
      if (e.error is OSError || e.error is SocketException) {
        return left(RequestFailure.networkError());
      }

      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return left(RequestFailure.serverError());
      }

      if (e.response == null || e.response!.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      return left(RequestFailure.serverError());
    }
  }

  @override
  Future<Either<RequestFailure, Package>> getPackageName(
      {required String packageName}) async {
    try {
      final response = await dio.get('$path/$packageName',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var package = Mapper.packageFromMap(response.data);

      return Right(package);
    } on DioError catch (e) {
      if (e.error is OSError || e.error is SocketException) {
        return left(RequestFailure.networkError());
      }

      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return left(RequestFailure.serverError());
      }

      if (e.response == null || e.response!.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      return left(RequestFailure.serverError());
    }
  }

  @override
  Future<Either<RequestFailure, Metric>> getMetricPackage(
      {required String package}) async {
    try {
      final response = await dio.get('$path/$package/metrics',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var metric = Mapper.metricFromMap(response.data);

      return Right(metric);
    } on DioError catch (e) {
      if (e.error is OSError || e.error is SocketException) {
        return left(RequestFailure.networkError());
      }

      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return left(RequestFailure.serverError());
      }

      if (e.response == null || e.response!.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      return left(RequestFailure.serverError());
    }
  }

  @override
  Future<Either<RequestFailure, String>> getPublisher(
      {required String packageName}) async {
    try {
      final response = await dio.get('$path/$packageName/publisher',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var publisher = response.data['publisherId'] ?? '';

      return Right(publisher);
    } on DioError catch (e) {
      if (e.error is OSError || e.error is SocketException) {
        return left(RequestFailure.networkError());
      }

      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return left(RequestFailure.serverError());
      }

      if (e.response == null || e.response!.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      return left(RequestFailure.serverError());
    }
  }
}
