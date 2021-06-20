import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parseData', () {
    var package = Package.from({
      "name": "ijk_player_recorder",
      "latest": {
        "version": "0.0.5",
        "pubspec": {
          "name": "ijk_player_recorder",
          "description": "IJKPlayerRecorder",
          "version": "0.0.5",
          "homepage": null,
          "environment": {"sdk": ">=2.12.0 <3.0.0", "flutter": ">=1.20.0"},
          "dependencies": {
            "flutter": {"sdk": "flutter"},
            "path_provider": "^2.0.2"
          },
          "dev_dependencies": {
            "flutter_test": {"sdk": "flutter"}
          },
          "flutter": {
            "plugin": {
              "platforms": {
                "android": {
                  "package": "com.hi.ijk_player_recorder",
                  "pluginClass": "IjkPlayerRecorderPlugin"
                },
                "ios": {"pluginClass": "IjkPlayerRecorderPlugin"}
              }
            }
          }
        },
        "archive_url":
            "https://pub.dartlang.org/packages/ijk_player_recorder/versions/0.0.5.tar.gz",
        "package_url":
            "https://pub.dartlang.org/api/packages/ijk_player_recorder",
        "url":
            "https://pub.dartlang.org/api/packages/ijk_player_recorder/versions/0.0.5"
      }
    });
  });
}
