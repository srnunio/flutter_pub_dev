import 'dependency.dart';
import 'environment.dart';

class Pubspec {
  final String name;
  final String version;
  final String description;
  final String homepage;
  final String repository;
  final Environment environment;
  final List<Dependency> dependencies;
  final List<Dependency> devDependencies;

  Pubspec(
      {required this.name,
      required this.version,
      required this.description,
      required this.homepage,
      required this.repository,
      required this.environment,
      required this.dependencies,
      required this.devDependencies});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'version': this.version,
      'description': this.description,
      'repository': this.repository,
      'homepage': this.homepage,
      'dependencies': this.dependencies,
      'dev_dependencies': this.devDependencies,
    };
  }


}
