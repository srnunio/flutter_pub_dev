class Dependencie{
  String name;
  String version;

  Dependencie({this.name, this.version});

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
}