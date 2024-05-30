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

 
testWidgets('Registro duplicado correo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget, reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget, reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('NombreUsuario')), "ximena");
    await tester.enterText(find.byKey(const Key('CorreoRegistro')), "korra@gmail.com");
    await tester.enterText(find.byKey(const Key('pass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
     await tester.pumpAndSettle(Duration(seconds:1));
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Correo ya se encuentra en uso'), findsOneWidget, reason: "'Correo ya se encuentra en uso' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Registro contraseñas no son iguales', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget, reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget, reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('NombreUsuario')), "ximena");
    await tester.enterText(find.byKey(const Key('CorreoRegistro')), "ximena@gmail.com");
    await tester.enterText(find.byKey(const Key('pass')), "T123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds:1));
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Las contraseñas no son iguales'), findsOneWidget, reason: "'Las contraseñas no son iguales' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });


  testWidgets('Registro sin nombre de usuario', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget, reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget, reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('CorreoRegistro')), "chenford@gmail.com");
    await tester.enterText(find.byKey(const Key('pass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
     await tester.pumpAndSettle(Duration(seconds:1));
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Ingresa los datos faltantes.'), findsOneWidget, reason: "'Ingresa los datos faltantes.' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });


  testWidgets('Registro sin correo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget, reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget, reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('NombreUsuario')), "wopez");
    await tester.enterText(find.byKey(const Key('pass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds:1));
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Ingresa los datos faltantes.'), findsOneWidget, reason: "'Ingresa los datos faltantes.' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });


testWidgets('Registro sin password', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget, reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget, reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('NombreUsuario')), "chenford");
    await tester.enterText(find.byKey(const Key('CorreoRegistro')), "chen@gmail.com");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds:1));
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Ingresa los datos faltantes.'), findsOneWidget, reason: "'Ingresa los datos faltantes.' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });


testWidgets('Registro sin confirmar password', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();

    // Verify the 'Acceder' button is present
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Tap the 'Acceder' button
    await tester.tap(find.byKey(const Key('Registrarse')));
    await tester.pumpAndSettle();

    // Verify the email and password fields are present
    expect(find.byKey(const Key('NombreUsuario')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('pass')), findsOneWidget, reason: "Password field not found");
    expect(find.byKey(const Key('confPass')), findsOneWidget, reason: "Email field not found");

    // Enter email and password
    await tester.enterText(find.byKey(const Key('NombreUsuario')), "chen");
    await tester.enterText(find.byKey(const Key('CorreoRegistro')), "lopez@gmail.com");
    await tester.enterText(find.byKey(const Key('pass')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds:1));
    await tester.tap(find.byKey(const Key('Registrar')));
    await tester.pumpAndSettle();
    // Verify 'Bienvenido' text is displayed
    expect(find.text('Ingresa los datos faltantes.'), findsOneWidget, reason: "'Ingresa los datos faltantes.' text not found");

    await Future.delayed(const Duration(seconds: 5));
  });

   

}



