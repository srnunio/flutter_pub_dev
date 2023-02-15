import 'package:flutter_package/src/domain/packages/entities/pubspec.dart';

class Version {
  final String version;
  final String archiveUrl;
  final String published;
  final Pubspec pubspec;

  Version(
      {required this.version,
      required this.archiveUrl,
      required this.pubspec,
      required this.published});

  Map<String, dynamic> toMap() {
    return {
      'version': this.version,
      'published': this.published,
      'archive_url': this.archiveUrl,
      'pubspec': this.pubspec,
    };
  }
}

extension VersionEx on Version{
  DateTime get date => DateTime.parse(published);
}