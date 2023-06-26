import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/search/i_search_repository.dart';

class BaseSearchRepository extends ISearchRepository {
  BaseSearchRepository(Dio dio) : super(dio);

  @override
  Future<Either<RequestFailure, List<String>>> searchPackage(
      {required int page, required String query}) async {
    query = query.trim().toLowerCase();

    try {
      final response = await dio.get('$path?q=$query&page=$page',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));

      if (response.statusCode != 200) return Left(RequestFailure.serverError());

      var packages = List.from(response.data['packages']).map<String>((data) {
        return data['package'];
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
}
