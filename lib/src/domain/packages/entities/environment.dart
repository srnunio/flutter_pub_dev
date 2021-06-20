class Environment {
  String sdk;

  Environment({required this.sdk});

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

  static Environment get empty => Environment(sdk: '');
}

extension EnvironmentEx on Environment {
  bool get hasData => (sdk.isNotEmpty);
}
