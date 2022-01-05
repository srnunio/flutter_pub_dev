import 'package:flutter_package/src/domain/packages/entities/pubspec.dart';

class Version {
  final String version;
  final String archive_url;
  final String published;
  final Pubspec pubspec;

  Version(
      {required this.version,
      required this.archive_url,
      required this.pubspec,
      required this.published});

  Map<String, dynamic> toMap() {
    return {
      'version': this.version,
      'published': this.published,
      'archive_url': this.archive_url,
      'pubspec': this.pubspec,
    };
  }
}

extension VersionEx on Version{
  DateTime get date => DateTime.parse(published);
}