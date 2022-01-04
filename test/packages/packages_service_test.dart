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

  test('parse metric', () {
    var metric = Mapper.metricFromMap({
      "score": {
        "grantedPoints": 130,
        "maxPoints": 130,
        "likeCount": 1825,
        "popularityScore": 0.9966736201161414,
        "lastUpdated": "2022-01-01T23:21:17.546530Z"
      },
      "scorecard": {
        "packageName": "file_picker",
        "packageVersion": "4.3.0",
        "runtimeVersion": "2021.12.15",
        "updated": "2022-01-01T23:21:17.546530Z",
        "packageCreated": "2018-09-09T12:19:22.056877Z",
        "packageVersionCreated": "2021-12-19T20:14:55.645026Z",
        "grantedPubPoints": 130,
        "maxPubPoints": 130,
        "popularityScore": 0.9966736201161414,
        "derivedTags": [
          "sdk:flutter",
          "platform:android",
          "platform:ios",
          "platform:windows",
          "platform:linux",
          "platform:macos",
          "platform:web",
          "is:plugin",
          "is:null-safe"
        ],
        "flags": [
          "latest-stable",
          "uses-flutter"
        ],
        "reportTypes": [
          "pana",
          "dartdoc"
        ],
        "dartdocReport": {
          "timestamp": "2021-12-19T20:29:28.843111Z",
          "reportStatus": "success",
          "dartdocEntry": {
            "uuid": "b3c88fc2-a7f0-4b04-9c7d-b1060f7d70ff",
            "packageName": "file_picker",
            "packageVersion": "4.3.0",
            "isLatest": true,
            "isObsolete": false,
            "usesFlutter": true,
            "runtimeVersion": "2021.12.15",
            "sdkVersion": "2.15.1",
            "dartdocVersion": "4.1.0",
            "flutterVersion": "2.8.0",
            "timestamp": "2021-12-19T20:29:25.455384Z",
            "runDuration": 104689469,
            "depsResolved": true,
            "hasContent": true,
            "archiveSize": 66655,
            "totalSize": 484103
          },
          "documentationSection": {
            "id": "documentation",
            "title": "Provide documentation",
            "grantedPoints": 10,
            "maxPoints": 10,
            "status": "passed",
            "summary": "### [*] 10/10 points: 20% or more of the public API has dartdoc comments\n\n* 20 out of 46 API elements (43.5 %) have documentation comments."
          }
        },
        "panaReport": {
          "timestamp": "2022-01-01T23:21:17.508199Z",
          "panaRuntimeInfo": {
            "panaVersion": "0.21.4",
            "sdkVersion": "2.15.1",
            "flutterVersions": {
              "frameworkVersion": "2.8.0",
              "channel": "unknown",
              "repositoryUrl": "unknown source",
              "frameworkRevision": "cf4400006550b70f28e4b4af815151d1e74846c6",
              "frameworkCommitDate": "2021-12-08 14:06:50 -0800",
              "engineRevision": "40a99c595137e4b2f5b2efa8ff343ea23c1e16b8",
              "dartSdkVersion": "2.15.0",
              "flutterRoot": "/tool/stable/flutter"
            }
          },
          "reportStatus": "success",
          "derivedTags": [
            "sdk:flutter",
            "platform:android",
            "platform:ios",
            "platform:windows",
            "platform:linux",
            "platform:macos",
            "platform:web",
            "is:plugin",
            "is:null-safe"
          ],
          "allDependencies": [
            "characters",
            "collection",
            "ffi",
            "flutter",
            "flutter_plugin_android_lifecycle",
            "flutter_test",
            "flutter_web_plugins",
            "js",
            "lints",
            "meta",
            "path",
            "plugin_platform_interface",
            "sky_engine",
            "typed_data",
            "vector_math"
          ],
          "licenseFile": {
            "path": "LICENSE",
            "name": "MIT"
          },
          "report": {},
          "urlProblems": []
        }
      }
    });
    print('package: ${metric.tags}');
  });
}
