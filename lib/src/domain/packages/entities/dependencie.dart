class Dependencie{
  String name;
  String version;

  Dependencie({required this.name, required this.version});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'version': this.version,
    };
  }

  factory Dependencie.fromMap(Map<String, dynamic> map) {

    return new Dependencie(
      name: map['name'] as String,
      version: map['version'] as String,
    );
  }

  static List<Dependencie> getDependencies(
      Map<String, dynamic> dependencies) {
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
}

