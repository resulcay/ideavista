import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ideavista/main.dart' as app;

void main() {
  testWidgets('Home Page Test', (WidgetTester tester) async {
    app.main();
    await tester.pumpWidget(app.Root());

    await tester.pumpAndSettle();
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Success Dialog'), findsOneWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.check_circle));
    await tester.pumpAndSettle();

    expect(find.text('Test Title'), findsNothing);
  });
}
