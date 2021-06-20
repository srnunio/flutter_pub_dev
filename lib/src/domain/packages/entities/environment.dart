class Environment {
  String sdk;

  Environment({required this.sdk});

  Map<String, dynamic> toMap() {
    return {
      'sdk': this.sdk,
    };
  }

  static Environment get empty => Environment(sdk: '');
}

extension EnvironmentEx on Environment {
  bool get hasData => (sdk.isNotEmpty);
}
