import 'package:flutter_package/src/domain/packages/entities/version.dart';

class Package {
  final String name;
  final String packageUrl;
  final String url;
  final List<Version> versions;
  final Version latest;

  const Package(
      {required this.name,
        required this.packageUrl,
        required this.url,
        required this.latest,
        required this.versions});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'package_url': this.packageUrl,
      'url': this.url,
      'versions': this.versions,
      'latest': this.latest,
    };
  }
}
