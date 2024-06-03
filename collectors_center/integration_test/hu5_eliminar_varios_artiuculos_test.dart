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

    // AGREGAR CATEGORIA CODIGO

    // Ir a artículos
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // AGREGAR ARTICULOS CODIGO

    // Click en eliminar
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('DeleteIcon')));
    await tester.pumpAndSettle();

    // Seleccionar articulo
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('1')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Click en aceptar eliminación
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('DeleteIcon')));
    await tester.pumpAndSettle();

    // Confirmar eliminación
    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('Los artículos han sido eliminados'), findsOneWidget, reason: "'La categoría ha sido eliminada correctamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
}
