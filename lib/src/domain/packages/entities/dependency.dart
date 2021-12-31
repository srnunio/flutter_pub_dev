class Dependency{
  String name;
  String version;

  Dependency({required this.name, required this.version});
  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'version': this.version,
    };
  }
}

