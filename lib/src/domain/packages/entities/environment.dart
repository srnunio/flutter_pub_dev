class Environment {
  final String sdk;
  final String flutter;

  Environment({required this.sdk, required this.flutter});

  Map<String, dynamic> toMap() {
    return {
      'sdk': this.sdk,
      'flutter': this.flutter,
    };
  }

  static Environment get empty =>
      Environment(sdk: '>=2.12.0 <3.0.0', flutter: '');
}

extension EnvironmentEx on Environment {
  bool get hasData => (sdk.isNotEmpty);
}
