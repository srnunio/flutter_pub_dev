import 'package:flutter_package/src/domain/packages/entities/dependency.dart';
import 'package:flutter_package/src/domain/packages/entities/environment.dart';
import 'package:flutter_package/src/domain/packages/entities/package.dart';
import 'package:flutter_package/src/domain/packages/entities/pubspec.dart';
import 'package:flutter_package/src/domain/packages/entities/score.dart';
import 'package:flutter_package/src/domain/packages/entities/version.dart';

/// [Mapper] parsed values
abstract class Mapper {
  /// [dependencyFromMap] parse map to dependency object
  Dependency dependencyFromMap(Map<String, dynamic> map) {
    return new Dependency(
      name: map['name'] as String,
      version: map['version'] as String,
    );
  }

  /// [_getDependencies] returns a list of dependency
  static List<Dependency> _getDependencies(Map<String, dynamic> dependencies) {
    try {
      var entries = dependencies.entries.toList();
      entries.removeWhere((element) => (element.value is Map));
      return entries
          .map((e) => Dependency(version: e.value, name: e.key))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// [packageFromMap] parse map to package object
  static Package packageFromMap(Map<String, dynamic> map) {
    var versions = (!map.containsKey('versions') || map['versions'] == null)
        ? <Version>[]
        : List.from(map['versions']).map((e) => versionFromMap(e)).toList();

    var package_url =
        (map['package_url'] != null) ? map['package_url'] as String : '';

    return Package(
      name: map['name'] as String,
      package_url: package_url,
      url: (map['url'] != null) ? map['url'] as String : '',
      versions: versions,
      // dependencies: dependencies,
      latest: versionFromMap(map['latest']),
    );
  }

  /// [environmentFromMap] parse map to environment object
  static Environment environmentFromMap(Map<String, dynamic> map) {
    return new Environment(
      sdk: map['sdk'] as String,
    );
  }

  /// [pubspecFromMap] parse map to pubspec object
  static Pubspec pubspecFromMap(Map<String, dynamic> map) {
    var dependencies = (map['dependencies'] == null)
        ? <Dependency>[]
        : _getDependencies(map['dependencies']);

    var dev_dependencies = (map['dev_dependencies'] == null)
        ? <Dependency>[]
        : _getDependencies(map['dev_dependencies']);

    var environment = (map['environment'] == null)
        ? Environment.empty
        : environmentFromMap(map['environment']);

    return Pubspec(
        name: map['name'] as String,
        version: map['version'] as String,
        description: map['description'] as String,
        repository:
            (map['repository'] != null) ? map['repository'] as String : '',
        homepage: (map['homepage'] != null) ? map['homepage'] as String : '',
        dev_dependencies: dev_dependencies,
        dependencies: dependencies,
        environment: environment);
  }

  /// [scoreFromMap] parse map to score object
  static Score scoreFromMap(Map<String, dynamic> map) {
    return Score(
      maxPoints: map['maxPoints'] as int,
      grantedPoints: map['grantedPoints'] as int,
      likeCount: map['likeCount'] as int,
      popularityScore: map['popularityScore'] as double,
    );
  }

  /// [versionFromMap] parse map to version object
  static Version versionFromMap(Map<String, dynamic> map) {
    return new Version(
      version: map['version'] as String,
      archive_url: map['archive_url'] as String,
      pubspec: pubspecFromMap(map['pubspec']),
    );
  }
}
