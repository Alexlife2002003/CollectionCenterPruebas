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
      'Agregar descripción de menos de 15 caracteres a categoría cuando es creada',
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

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Gatos");
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.enterText(
        find.byKey(const Key('descripcionCategoria')), "Gatitos.");
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Comprobar mensaje
    expect(
        find.text(
            'La descripción debe contener letras y tener al menos 15 caracteres'),
        findsOneWidget,
        reason:
            "'La descripción debe contener letras y tener al menos 15 caracteres' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 60));
  });

  testWidgets(
      'Agregar descripción a categoría cuando es creada con el mismo nombre al de la categoria',
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

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(
        find.byKey(const Key('nombreCategoria')), "hiperblanduzcos");
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.enterText(
        find.byKey(const Key('descripcionCategoria')), "hiperblanduzcos");
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Comprobar mensaje
    expect(
        find.text(
            'La descripción no puede ser igual al nombre de la categoría.'),
        findsOneWidget,
        reason:
            "'La descripción no puede ser igual al nombre de la categoría.' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Agregar descripción a categoría cuando es creada',
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

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Gatos");
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')),
        "La descripción correspondiemte para los gatos.");
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('Categoría agregada exitosamente'), findsOneWidget,
        reason: "'Categoría agregada exitosamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
}
