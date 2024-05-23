import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hola_mundo2/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Agrega materia', (WidgetTester tester) async {
    await tester.pumpWidget(const AppState());

    await tester.enterText(find.byKey(const Key('username')), "holamundo");
    await tester.enterText(find.byKey(const Key('password')), "admin123");

    await tester.tap(find.byType(ElevatedButton));

    await Future.delayed(const Duration(seconds: 1));

    await tester.tap(find.byType(FloatingActionButton));

    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 1));

    await tester.enterText(find.byKey(const Key('clave')), "123");
    await tester.enterText(find.byKey(const Key('materia')), "Testing");
    await tester.enterText(find.byKey(const Key('creditos')), "12");

    await tester.tap(find.byKey(const Key('semestre')));

    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.text('7'));

    await Future.delayed(const Duration(seconds: 1));

    await tester.tap(find.byKey(const Key('botonAgregar')));
    await Future.delayed(const Duration(seconds: 1));

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 1));

    expect(find.text('Se guardó con éxito la materia'), findsOneWidget);
  });
}
