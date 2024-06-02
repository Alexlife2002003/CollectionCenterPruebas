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
      'Modificar descripción de un artículo con mismo nombre del artículo.',
      (WidgetTester tester) async {
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
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('El super mundo').last);
    await tester.pumpAndSettle(Duration(seconds: 10));

    // Agregar articulo
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Image')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AppAsset')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byKey(const Key('nombreArticulo')), findsOneWidget,
        reason: "nombreARticulo field not found");
    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");
    await tester.enterText(
        find.byKey(const Key('nombreArticulo')), "Gato Bomba");
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.enterText(find.byKey(const Key('Descripcion')),
        "Descripcion que puse en esta parte.");
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(Duration(seconds: 1));

    // Seleccionar articulo
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Editar
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 4));

    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");

    await tester.enterText(find.byKey(const Key('Descripcion')), "Gato Bomba");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    // Confirmar edición
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Esperar un breve retraso antes de intentar encontrar el texto
    await Future.delayed(const Duration(seconds: 1));

    // Mensaje
    expect(find.text('Descripción no puede ser igual al nombre del artículo'),
        findsOneWidget,
        reason:
            "'Descripción no puede ser igual al nombre del artículo' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets(
      'Modificar descripción de un artículo con el nombre igual a la categoría.',
      (WidgetTester tester) async {
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
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('El super mundo').last);
    await tester.pumpAndSettle(Duration(seconds: 10));

    // Seleccionar articulo
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Editar
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 4));

    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");

    await tester.enterText(
        find.byKey(const Key('Descripcion')), "El super mundo");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    // Confirmar edición
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Esperar un breve retraso antes de intentar encontrar el texto
    await Future.delayed(const Duration(seconds: 1));

    // Mensaje
    expect(
        find.text('Descripción no puede ser igual al nombre de la categoría'),
        findsOneWidget,
        reason:
            "'Descripción no puede ser igual al nombre de la categoría' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets(
      'Modificar descripción de un artículo con menos de 10 caracteres.',
      (WidgetTester tester) async {
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
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('El super mundo').last);
    await tester.pumpAndSettle(Duration(seconds: 10));

    // Seleccionar articulo
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Editar
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 4));

    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");

    await tester.enterText(find.byKey(const Key('Descripcion')), "Si");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    // Confirmar edición
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Esperar un breve retraso antes de intentar encontrar el texto
    await Future.delayed(const Duration(seconds: 1));

    // Mensaje
    expect(
        find.text(
            'Descripción debe contener mínimo 10 caracteres si no es vacia'),
        findsOneWidget,
        reason:
            "'Descripción debe contener mínimo 10 caracteres si no es vacia' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Modificar descripción de un artículo exitosamente.',
      (WidgetTester tester) async {
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
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('El super mundo').last);
    await tester.pumpAndSettle(Duration(seconds: 10));

    // Seleccionar articulo
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Editar
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 4));

    expect(find.byKey(const Key('Descripcion')), findsOneWidget,
        reason: "Descripcion field not found");

    await tester.enterText(find.byKey(const Key('Descripcion')),
        "El gato saltó en el agua e hizo SPLASH");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();

    // Confirmar edición
    await tester.tap(find.byKey(const Key('edit')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Esperar un breve retraso antes de intentar encontrar el texto
    await Future.delayed(const Duration(seconds: 1));

    // Mensaje
    expect(find.text('Se han guardado los cambios'), findsOneWidget,
        reason: "'Se han guardado los cambios' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });
}
