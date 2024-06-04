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

  testWidgets('Revisar widgets3', (WidgetTester tester) async {
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
    await tester.enterText(find.byKey(const Key('email')), "amigo1@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Perfil')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.text("Borrar cuenta"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.text("Eliminar"));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    expect(find.byKey(const Key('Registrarse')), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  });
  testWidgets('Revisar widgets2', (WidgetTester tester) async {
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
    await tester.tap(find.byKey(const Key('logout')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle(Duration(seconds: 2));
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    expect(find.byKey(const Key('Registrarse')), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  });

  testWidgets('Revisar widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Regresar'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Regresar'));
    await tester.pumpAndSettle();
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
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed

    expect(find.text('Bienvenido'), findsOneWidget,
        reason: "'Bienvenido' text not found");
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    expect(find.text('Collectors Center'), findsOneWidget,
        reason: "Inicio field not found");
    expect(find.text('Inicio'), findsOneWidget,
        reason: "Inicio field not found");
    expect(find.byKey(const Key('Articulos')), findsOneWidget,
        reason: 'Articulos field not found');
    expect(find.byKey(const Key('Categorias')), findsOneWidget,
        reason: 'Categorias field not found');
    expect(find.text('Amigos'), findsOneWidget,
        reason: "Amigos field not found");
    expect(find.text('Notificaciones'), findsOneWidget,
        reason: "Notificaciones field not found");
    expect(find.byKey(const Key('logout')), findsOneWidget,
        reason: 'Cerrar sesion field not found');

    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle();
    expect(find.text('Artículos'), findsOneWidget,
        reason: "Artiuclos field not found");
    expect(find.byKey(const Key('DeleteIcon')), findsOneWidget,
        reason: "DeleteIcon field not found");
    expect(find.byKey(const Key('AddIcon')), findsOneWidget,
        reason: "AddIcon field not found");
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle();

    expect(find.text('Categorías'), findsOneWidget,
        reason: "Categorias field not found");
    expect(find.byKey(const Key('AddIcon')), findsOneWidget,
        reason: "AddIcon field not found");
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Amigos'));
    await tester.pumpAndSettle();
    expect(find.text('Amigos'), findsOneWidget,
        reason: "Amigos field not found");
    expect(find.byKey(const Key('add_friend')), findsOneWidget,
        reason: "addFriend field not found");
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(Duration(seconds: 5));
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Notificaciones'));
    await tester.pumpAndSettle();

    expect(find.text('Notificaciones'), findsOneWidget,
        reason: "Notificaciones field not found");

    await tester.tap(find.byKey(const Key('Perfil')));
    await tester.pumpAndSettle();
    expect(find.text(' Usuario:'), findsOneWidget,
        reason: "'Usuario' text not found");
    expect(find.text('Borrar cuenta'), findsOneWidget,
        reason: "'Borrar cuenta' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });
}
