import 'package:dio/dio.dart';

const String host = 'pub.dartlang.org';
const String apiBaseUrl = 'https://$host/api';

class NetworkBuilder {
  String _baseUrl = '';

  void setBaseUrl(String baseUrl) {
    ArgumentError.checkNotNull(baseUrl, 'baseUrl');
    _baseUrl = baseUrl;
  }

  Dio build() {
    final dio = Dio();
    dio.options.baseUrl = (_baseUrl.isEmpty) ? apiBaseUrl : _baseUrl;
    return dio;
  }
}
