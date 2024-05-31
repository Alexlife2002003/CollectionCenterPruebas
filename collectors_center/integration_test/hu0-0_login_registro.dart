
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

  testWidgets('Credenciales correctas en login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
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
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Bienvenido'), findsOneWidget,
        reason: "'Bienvenido' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Credenciales incorrectas en login', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
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
    await tester.enterText(find.byKey(const Key('password')), "Te123!");
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('La contraseña o el correo electrónico son incorrectos'),
        findsOneWidget,
        reason:
            "'La contraseña o el correo electrónico son incorrectos' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('login sin correo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('email')), findsOneWidget,
        reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget,
        reason: "Password field not found");

    await tester.enterText(find.byKey(const Key('password')), "Te123!");
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text(''), findsOneWidget,
        reason: "Ingresa tu correo electrónico y contraseña.' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('login sin contrasenia', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
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
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Ingresa tu correo electrónico y contraseña.'),
        findsOneWidget,
        reason: "'Ingresa tu correo electrónico y contraseña.' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Registro correcto', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget,
        reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget,
        reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget,
        reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget,
        reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('NombreUsuario')), "korra");
    await tester.enterText(
        find.byKey(const Key('CorreoRegistro')), "korra@gmail.com");
    await tester.enterText(find.byKey(const Key('pass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Bienvenido'), findsOneWidget,
        reason: "'Bienvenido' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Registro duplicado usuario', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget,
        reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget,
        reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget,
        reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget,
        reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('NombreUsuario')), "korra");
    await tester.enterText(
        find.byKey(const Key('CorreoRegistro')), "korra2@gmail.com");
    await tester.enterText(find.byKey(const Key('pass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Usuario ya se encuentra en uso'), findsOneWidget,
        reason: "'Usuario ya se encuentra en uso' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });
}
