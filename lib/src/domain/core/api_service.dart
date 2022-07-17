import 'package:dio/dio.dart';

abstract class Api {
  const Api(this.dio) : assert(dio != null);
  final Dio dio;
}
