import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parseData', () {
    var package = Package.from({
      "name": "waveform",
      "latest": {
        "version": "0.0.1-nightly.38",
        "pubspec": {
          "description": "A new Flutter package project.",
          "homepage": "https://github.com/hydro-sdk/waveform",
          "name": "waveform",
          "version": "0.0.1-nightly.38",
          "dependencies": {
            "args": "^1.6.0",
            "git": "^1.0.1",
            "github": "^7.0.4",
            "http": "^0.12.2",
            "hydro_sdk_version": "^1.2.0",
            "meta": "^1.3.0-nullsafety.3",
            "yaml": "^2.2.1",
            "yaml_modify": "^0.1.3",
            "flutter": {"sdk": "flutter"}
          },
          "dev_dependencies": {
            "flutter_test": {"sdk": "flutter"}
          },
          "environment": {"sdk": ">=2.7.0 <3.0.0"},
          "flutter": null
        },
        "archive_url":
            "https://pub.dartlang.org/packages/waveform/versions/0.0.1-nightly.38.tar.gz",
        "package_url": "https://pub.dartlang.org/api/packages/waveform",
        "url":
            "https://pub.dartlang.org/api/packages/waveform/versions/0.0.1-nightly.38"
      }
    });
  });
}
