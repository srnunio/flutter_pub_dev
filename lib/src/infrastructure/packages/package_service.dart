
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/packages/entities/score.dart';
import 'package:flutter_package/src/domain/packages/i_package_service.dart';
import 'package:flutter_package/src/infrastructure/core/mapper.dart';

class PackageService extends IPackageService {
  PackageService(Dio dio) : super(dio);

  @override
  Future<Either<RequestFailure, List<Package>>> getPackages(
      {required int page}) async {
    try {
      final response = await dio.get('${path}?page=${page}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var packages = List.from(response.data['packages']).map<Package>((data) {
        // print('data: ${json.encode(data)}');
        return Mapper.packageFromMap(data);
      }).toList();

      return (packages.isEmpty)
          ? Left(RequestFailure.empty())
          : Right(packages);
    } on DioError catch (e) {
      if (e.error is OSError || e.error is SocketException) {
        return left(RequestFailure.networkError());
      }

      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return left(RequestFailure.serverError());
      }

      if (e.response == null || e.response!.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      print('getPackages: $error');
      return left(RequestFailure.serverError());
    }
  }

  @override
  Future<Either<RequestFailure, Package>> getPackageName(
      {required String namePackage}) async {
    try {
      final response = await dio.get('$path/$namePackage',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      print('${response.statusCode}');

      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var package = Mapper.packageFromMap(response.data);

      return Right(package);
    } on DioError catch (e) {
      if (e.error is OSError || e.error is SocketException) {
        return left(RequestFailure.networkError());
      }

      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return left(RequestFailure.serverError());
      }

      if (e.response == null || e.response!.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      print('$error');
      return left(RequestFailure.serverError());
    }
  }

  @override
  Future<Either<RequestFailure, Score>> getScorePackage(
      {required String namePackage}) async {
    try {
      final response = await dio.get('$path/$namePackage/score',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var score = Mapper.scoreFromMap(response.data);

      return Right(score);
    } on DioError catch (e) {
      if (e.error is OSError || e.error is SocketException) {
        return left(RequestFailure.networkError());
      }

      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return left(RequestFailure.serverError());
      }

      if (e.response == null || e.response!.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      print('$error');
      return left(RequestFailure.serverError());
    }
  }
}
