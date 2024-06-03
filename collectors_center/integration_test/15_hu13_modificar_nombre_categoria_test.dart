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
  testWidgets('Modificar nombre de categoría por uno ya existente.',
      (WidgetTester tester) async {
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
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Perro");
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')),
        "La descripción de la categoría que puse.");
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Seleccionar categoría
    await tester.tap(find.text('Perro').last);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Click a editar
    await tester.tap(find.byKey(const Key('edit_name')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byKey(const Key('Nombre')), findsOneWidget,
        reason: "Descripcion field not found");
    await tester.enterText(find.byKey(const Key('Nombre')), "ranas");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('edit_name')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('El nombre de la categoría ya existe'), findsOneWidget,
        reason: "'El nombre de la categoría ya existe' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Modificar nombre de categoría exitoso.',
      (WidgetTester tester) async {
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

    // Seleccionar categoría
    await tester.tap(find.text('Perro').last);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Click a editar
    await tester.tap(find.byKey(const Key('edit_name')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Nombre')), findsOneWidget,
        reason: "Descripcion field not found");
    await tester.enterText(find.byKey(const Key('Nombre')), "GATOOOOOOOOOOO");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('edit_name')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.pumpAndSettle(Duration(seconds: 1));

    // Comprobar mensaje
    expect(find.text('Se han guardado los cambios'), findsOneWidget,
        reason: "'Se han guardado los cambios' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
}
