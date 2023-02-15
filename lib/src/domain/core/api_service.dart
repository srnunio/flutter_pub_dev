import 'package:dio/dio.dart';

abstract class Api {
  const Api(this.dio);
  final Dio dio;
}
