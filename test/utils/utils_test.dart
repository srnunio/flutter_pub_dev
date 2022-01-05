import 'package:flutter_package/src/domain/packages/entities/dependency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {

  test('lastDuration', () {
    var now = DateTime.now();
    var time = DateTime.parse('2021-12-20T12:56:42.486428Z');
    var difference = now.difference(time);
    var days = difference.inDays;
    print("difference: $difference");
    print("days: $days");
  });

  test('lastUpdated', () {
    var time = DateTime.parse('2022-01-01T23:21:52.716522Z');
    var formated = DateFormat('dd-MMMM-yyyy').format(time);
    print("time: $time");
    print("time: $formated");
  });

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
