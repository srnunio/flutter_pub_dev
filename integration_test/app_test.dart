import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_package/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('search package', (tester) async {
    await tester.pumpAndSettle(Duration(seconds: 2));

    var button = find.byTooltip('search');

    await tester.tap(button);

    await tester.pumpAndSettle(Duration(milliseconds: 800));

    expect(find.byType(TextField), findsOneWidget);

    var editText = find.byType(TextField);
    await tester.enterText(editText, 'avatar_letter');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pump();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    var _find = await find.byWidgetPredicate((widget) =>
    widget.key != null && widget.key == ValueKey('search-result'));
    expect(_find, findsWidgets);
  });

  testWidgets('open detail of package', (tester) async {
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

  group('full test', () {
    testWidgets('full test app', (tester) async {
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

      await tester.pumpAndSettle(Duration(seconds: 2));

      var button = find.byTooltip('search');

      await tester.tap(button);

      await tester.pumpAndSettle(Duration(milliseconds: 800));

      expect(find.byType(TextField), findsOneWidget);

      var editText = find.byType(TextField);
      await tester.enterText(editText, 'avatar_letter');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      var _find = await find.byWidgetPredicate((widget) =>
      widget.key != null && widget.key == ValueKey('search-result'));
      expect(_find, findsWidgets);
    });
  });
}
