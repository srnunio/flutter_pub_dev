class Environment{
  String sdk;

  Environment({this.sdk});

  Map<String, dynamic> toMap() {
    return {
      'sdk': this.sdk,
    };
  }

  factory Environment.fromMap(Map<String, dynamic> map) {
    return new Environment(
      sdk: map['sdk'] as String,
    );
  }
}