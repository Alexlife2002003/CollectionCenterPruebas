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
  testWidgets('Eliminar categoría correctamente.', (WidgetTester tester) async {
     await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Acceder
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();

    // Verificar campos Email y Password
    expect(find.byKey(const Key('email')), findsOneWidget,
        reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget,
        reason: "Password field not found");

    // Ingresar Email y Password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Pez");
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')),
        "La descripción de la categoría que puse para un pez.");
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Seleccionar categoría
    await tester.tap(find.text('Pez').last);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Click en eliminar categoría
    await tester.tap(find.byKey(const Key('Eliminar')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Confirmar eliminación
    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('La categoría ha sido eliminada correctamente'), findsOneWidget, reason: "'La categoría ha sido eliminada correctamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
}
