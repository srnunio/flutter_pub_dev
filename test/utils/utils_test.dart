import 'package:flutter_package/src/domain/packages/entities/dependency.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dependencies', () {
    var dependenciesMap = {
      "flutter": {"sdk": "flutter"},
      "async": "^2.4.2",
      "args": "^1.5.2",
      "encrypt": "^4.0.2",
      "cron": "^0.2.3",
      "dcli": "^0.41.0",
      "path": "^1.6.4",
      "pub_semver": "^1.0.0",
      "xml": "^4.2.0",
      "http": "^0.12.1",
      "intl": "^0.16.1",
      "isolate": "^2.0.3",
      "meta": "^1.0.0",
      "pedantic": "^1.0.0",
      "pub_release": "^4.0.0",
      "public_suffix": "^1.0.0",
      "settings_yaml": "^2.0.0",
      "uuid": "^2.0.4",
      "validators": "^2.0.0",
      "nginx_le_shared": "^5.0.0",
      "yaml": "^2.2.1"
    };

    var entries = dependenciesMap.entries.toList();

    entries.removeWhere((element) => (element.value is Map));

    var dependencies = entries
        .map((e) => Dependency(version: (e.value as String), name: e.key))
        .toList();

    print(dependencies);
  });
}
