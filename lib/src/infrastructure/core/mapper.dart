import 'package:flutter_package/src/domain/packages/entities/dependencie.dart';
import 'package:flutter_package/src/domain/packages/entities/environment.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/packages/entities/pubspec.dart';
import 'package:flutter_package/src/domain/packages/entities/score.dart';
import 'package:flutter_package/src/domain/packages/entities/version.dart';

abstract class Mapper {
  Dependencie dependencieFromMap(Map<String, dynamic> map) {
    return new Dependencie(
      name: map['name'] as String,
      version: map['version'] as String,
    );
  }

  static List<Dependencie> _getDependencies(Map<String, dynamic> dependencies) {
    try {
      var entries = dependencies.entries.toList();
      entries.removeWhere((element) => (element.value is Map));
      return entries
          .map((e) => Dependencie(version: e.value, name: e.key))
          .toList();
    } catch (e) {
      return [];
    }
  }

  static Package packageFromMap(Map<String, dynamic> map) {
    var versions = (!map.containsKey('versions') || map['versions'] == null)
        ? <Version>[]
        : List.from(map['versions']).map((e) => versionFromMap(e)).toList();

    var dependencies =
        (map['latest']['pubspec']['dependencies'] == null)
            ? <Dependencie>[]
            : _getDependencies(map['latest']['pubspec']['dependencies']);

    var package_url =
        (map['package_url'] != null) ? map['package_url'] as String : '';

    return Package(
      name: map['name'] as String,
      package_url: package_url,
      url: (map['url'] != null) ? map['url'] as String : '',
      versions: versions,
      dependencies: dependencies,
      latest: versionFromMap(map['latest']),
    );
  }

  static Environment environmentFromMap(Map<String, dynamic> map) {
    return new Environment(
      sdk: map['sdk'] as String,
    );
  }

  static Pubspec pubspecFromMap(Map<String, dynamic> map) {
    return Pubspec(
        name: map['name'] as String,
        version: map['version'] as String,
        description: map['description'] as String,
        repository:
            (map['repository'] != null) ? map['repository'] as String : '',
        homepage: (map['homepage'] != null) ? map['homepage'] as String : '',
        dev_dependencies: [],
        dependencies: [],
        environment: Environment.empty);
  }

  static Score scoreFromMap(Map<String, dynamic> map) {
    return Score(
      maxPoints: map['maxPoints'] as int,
      grantedPoints: map['grantedPoints'] as int,
      likeCount: map['likeCount'] as int,
      popularityScore: map['popularityScore'] as double,
    );
  }

  static Version versionFromMap(Map<String, dynamic> map) {
    return new Version(
      version: map['version'] as String,
      archive_url: map['archive_url'] as String,
      pubspec: pubspecFromMap(map['pubspec']),
    );
  }
}
