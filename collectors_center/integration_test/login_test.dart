import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hola_mundo2/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Credenciales incorrectas en login', (WidgetTester tester) async {
    await tester.pumpWidget(const AppState());

    await Future.delayed(const Duration(seconds: 2));

    await tester.enterText(find.byKey(const Key('username')), "holamundo");
    await tester.enterText(find.byKey(const Key('password')), "admin1232");

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    expect(find.text('Login fail'), findsOneWidget);
  });
  testWidgets('Credenciales correctas en login', (WidgetTester tester) async {
    await tester.pumpWidget(const AppState());

    await tester.enterText(find.byKey(const Key('username')), "holamundo");
    await tester.enterText(find.byKey(const Key('password')), "admin123");

    await tester.tap(find.byType(ElevatedButton));

    await Future.delayed(const Duration(seconds: 1));

    await tester.pumpAndSettle();

    expect(find.text('Materias'), findsOneWidget);

    await Future.delayed(const Duration(seconds: 2));

    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
