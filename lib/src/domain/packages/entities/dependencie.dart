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
}

