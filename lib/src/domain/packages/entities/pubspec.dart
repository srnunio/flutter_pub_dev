import 'dart:convert';

import 'dependencie.dart';
import 'environment.dart';
import 'version.dart';

class Pubspec {
  String name;
  String version;
  String description;
  String homepage;
  String repository;
  Environment environment;
  List<Dependencie> dependencies;
  List<Dependencie> dev_dependencies;

  Pubspec(
      {this.name,
      this.version,
      this.description,
      this.homepage,
      this.repository,
      this.environment,
      this.dependencies,
      this.dev_dependencies});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'version': this.version,
      'description': this.description,
      'repository': this.repository,
      'homepage': this.homepage,
      'dependencies': this.dependencies,
      'dev_dependencies': this.dev_dependencies,
    };
  }

  factory Pubspec.fromMap(Map<String, dynamic> map) {

    return new Pubspec(
      name: map['name'] as String,
      version: map['version'] as String,
      description: map['description'] as String,
      repository: map['repository'] as String,
      homepage: map['homepage'] as String,
    );
  }
}
