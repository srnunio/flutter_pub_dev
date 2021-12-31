import 'package:dio/adapter.dart';
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
    final defaultClient = DefaultHttpClientAdapter();
    defaultClient.onHttpClientCreate = (httpClient) {
      httpClient.badCertificateCallback = (_, host, __) => host == apiBaseUrl;
    };
    dio.httpClientAdapter = defaultClient;
    return dio;
  }
}
