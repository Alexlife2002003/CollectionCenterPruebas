import 'package:collectors_center/firebase_options.dart';
import 'package:collectors_center/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Load the environment variables
    await dotenv.load();

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });

  // PRUEBAS //
  testWidgets('Eliminar artículo exitosamente.', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    // Verify the email and password fields are present
    expect(find.byKey(const Key('email')), findsOneWidget,
        reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget,
        reason: "Password field not found");
    // Enter email and password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('El super mundo').last);
    await tester.pumpAndSettle();
    // Seleccionar articulo
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Eliminars
    await tester.tap(find.byKey(
        const Key('delete_object'))); // Es eliminar pero la Key dice guardar
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Confirmar eliminación
    await tester.tap(find.text('Eliminar').last);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Mensaje
    expect(find.text('El artículo ha sido eliminado correctamente'),
        findsOneWidget,
        reason: "'Artículo agregado exitosamente' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });
}
