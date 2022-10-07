import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_package/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('search package', (tester) async {
    app.main();

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
}
