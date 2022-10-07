import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_package/main.dart' as app;
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('detail of package', (tester) async {
    app.main();

    await tester.pumpAndSettle(Duration(seconds: 2));

    var index = Random().nextInt(50) + 1;

    final listFinder = find.byType(Scrollable);

    var itemFinder = find.byKey(ValueKey('package_$index'));

    expect(itemFinder, findsOneWidget);

    await tester.pump();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    if (index >= 5) {
      await tester.scrollUntilVisible(itemFinder, 500.0,
          duration: Duration(milliseconds: 300),
          scrollable: listFinder,
          maxScrolls: 500);
    }

    await tester.pump();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.pumpAndSettle();

    await tester.tap(itemFinder);

    await tester.pump();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    var backButton = find.byKey(ValueKey('BackButton'));

    await tester.pumpAndSettle(const Duration(seconds: 1));

    await tester.tap(backButton);
  });
}
