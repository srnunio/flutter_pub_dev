import 'package:flutter_package/src/domain/packages/entities/pubspec.dart';

class Version {
  String version;
  String archive_url;
  Pubspec pubspec;

  Version({required this.version, required this.archive_url, required this.pubspec});

  Map<String, dynamic> toMap() {
    return {
      'version': this.version,
      'archive_url': this.archive_url,
      'pubspec': this.pubspec,
    };
  }

  factory Version.fromMap(Map<String, dynamic> map) {
    return new Version(
      version: map['version'] as String,
      archive_url: map['archive_url'] as String,
      pubspec: Pubspec.fromMap(map['pubspec']),
    );
  }
}
