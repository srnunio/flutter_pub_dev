import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/infrastructure/core/mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parseData', () {
    var package = Mapper.packageFromMap({
      "name": "simple_copy_with_generators",
      "latest": {
        "version": "0.0.2",
        "pubspec": {
          "name": "simple_copy_with_generators",
          "description": "Generates a copywith method for classes marked @copywith annotation using build_runner",
          "homepage": "https://github.com/postflow/simple_copy_with_gen",
          "version": "0.0.2",
          "environment": {
            "sdk": ">=2.14.0 <3.0.0"
          },
          "dependencies": {
            "build": "^2.2.1",
            "source_gen": "^1.2.1",
            "analyzer": "^3.0.0",
            "simple_copy_with_annotations": "^0.0.2"
          },
          "dev_dependencies": {
            "build_runner": null,
            "build_test": null,
            "test": "^1.0.0"
          }
        },
        "archive_url": "https://pub.dartlang.org/packages/simple_copy_with_generators/versions/0.0.2.tar.gz",
        "package_url": "https://pub.dartlang.org/api/packages/simple_copy_with_generators",
        "url": "https://pub.dartlang.org/api/packages/simple_copy_with_generators/versions/0.0.2"
      }
    });
    print('package: $package');
  });
}
