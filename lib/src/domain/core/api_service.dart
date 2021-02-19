import 'package:dio/dio.dart';

abstract class ApiService {
  const ApiService(this.dio) : assert(dio != null);
  final Dio dio;
}
