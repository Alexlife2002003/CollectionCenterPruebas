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
  testWidgets(
      'Modificar descripción de menos de 15 caracteres a categoría.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));

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
    await tester.pumpAndSettle();

    // Ir a Categorias
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Seleccionar categoría
    await tester.tap(find.text('Categoria 1.1231421').last);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Click a editar descripcion
    await tester.tap(find.byKey(const Key('edit_description')));
    await tester.pumpAndSettle(Duration(seconds: 4));
    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");

    // Cambiar descripción
    await tester.enterText(find.byKey(const Key('Descripcion')), "1234567");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    // Confirmar edición
    await tester.tap(find.byKey(const Key('edit_description')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Esperar un breve retraso antes de intentar encontrar el texto
    await Future.delayed(const Duration(seconds: 1));

    // Mensaje
    expect(
        find.text('La descripción debe tener al menos 15 caracteres si no está vacía'),
        findsOneWidget,
        reason:
            "'La descripción debe tener al menos 15 caracteres si no está vacía ' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets(
      'Modificar descripción a categoría con el mismo nombre de la categoría.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));

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
    await tester.pumpAndSettle();

    // Ir a Categorias
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Seleccionar categoría
    await tester.tap(find.text('Categoria 1.1231421').last);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Click a editar descripcion
    await tester.tap(find.byKey(const Key('edit_description')));
    await tester.pumpAndSettle(Duration(seconds: 4));
    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");

    // Cambiar descripción
    await tester.enterText(find.byKey(const Key('Descripcion')), "Categoria 1.1231421");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    // Confirmar edición
    await tester.tap(find.byKey(const Key('edit_description')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Esperar un breve retraso antes de intentar encontrar el texto
    await Future.delayed(const Duration(seconds: 1));

    // Mensaje
    expect(
        find.text('La descripción no puede ser igual al nombre de la categoría'),
        findsOneWidget,
        reason:
            "'La descripción no puede ser igual al nombre de la categoría' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

    testWidgets(
      'Modificar descripción a categoría exitosamente.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));

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
    await tester.pumpAndSettle();

    // Ir a Categorias
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Seleccionar categoría
    await tester.tap(find.text('Categoria 1.1231421').last);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Click a editar descripcion
    await tester.tap(find.byKey(const Key('edit_description')));
    await tester.pumpAndSettle(Duration(seconds: 4));
    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");

    // Cambiar descripción
    await tester.enterText(find.byKey(const Key('Descripcion')), "Aqui voy a poner de que trata la categoría o tal vez no, pero bueno...");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    // Confirmar edición
    await tester.tap(find.byKey(const Key('edit_description')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Esperar un breve retraso antes de intentar encontrar el texto
    await Future.delayed(const Duration(seconds: 1));

    // Mensaje
    while (!tester.any(find.text('Se han guardado los cambios'))) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  });
}
