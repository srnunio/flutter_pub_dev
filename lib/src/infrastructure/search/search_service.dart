import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/dio.dart';
import 'package:flutter_package/src/domain/core/request_failure.dart';
import 'package:flutter_package/src/domain/search/i_search_service.dart';

class SearchService extends ISearchService {
  SearchService(Dio dio) : super(dio);

  @override
  Future<Either<RequestFailure, List<String>>> searchPackage(
      {int page, String query}) async {
    query = query.trim().toLowerCase();

    try {
      final response = await dio.get('${path}?q=$query&page=${page}',
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

      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT ||
          e.type == DioErrorType.SEND_TIMEOUT) {
        return left(RequestFailure.serverError());
      }

      if (e.response.statusCode == 500) {
        return Left(RequestFailure.serverError());
      }

      return Left(RequestFailure.serverError());
    } catch (error) {
      return left(RequestFailure.serverError());
    }
  }
}
