import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_package/core/utils/utils.dart';
import 'package:flutter_package/model/domain/package.dart';

class Api {
  static const _API = 'https://pub.dev/api/packages';
  http.Client _client;
  int _per_page = 100;
  int _page = 2;

  Api() {
    this._client = http.Client();
    initPage();
  }

  initPage() {
    _per_page = 100;
    _page = 1;
  }

  closerConnection() {
    if (_client == null) return;
    _client.close();
  }

  Future<List<Package>> getAllPackages(
      {String platform = '', String sort = '',String search = ''}) async {
    platform = platform.isNotEmpty ? '&platform=${platform}' : '';
    sort = sort.isNotEmpty ? '&sort=${sort}' : '';
    search = search.isNotEmpty ? '&q=${search}' : '';
    var query = '${_API}?page=${_page}${platform}${sort}${search}';

    Utils.logs('getAllPackages => query : ${query}');
    List<Package> packages = [];
    var response = await _client.get(query);
    if (response.statusCode == 200) {
      var parsed = json.decode(response.body)['packages'] as List<dynamic>;
      for (var value in parsed) {
        var pack = Package.fromMap(value);
        Utils.logs(' (${pack.name} - ${pack.latest.version})');
        packages.add(pack);
      }
      _page++;
    }
    return packages;
  }

  Future<Package> getOnePackage({String namePackage}) async {
    var query = '${_API}/${namePackage}';
    var response = await _client.get(query);
    if (response.statusCode == 200) {

      var data = json.decode(response.body) as dynamic;
      var package = Package.from(data);
      Utils.logs('response.package : (${data['versions']})');
      return package;
    }
    return null;
  }

  Future<List<String>> readme({String gitPath}) async {
    Utils.logs('readme : gitPath (${gitPath})');
    gitPath = gitPath
        .replaceAll('https://github.com/', '')
        .replaceAll('tree/', '')
        .replaceAll('master/', '');
    var url = 'https://raw.githubusercontent.com/${gitPath}/master/README.md';
    Utils.logs('readme : url (${url})');
    HttpClientResponse response = await new HttpClient()
        .getUrl(Uri.parse(url))
        .then((HttpClientRequest request) => request.close())
        .then((HttpClientResponse response) => response);
    return response.transform(new Utf8Decoder()).toList();
  }
}
