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

  // testWidgets('Crear cuenta de Amigo1', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyApp(
  //     isLoggedIn: false,
  //   ));
  //   await tester.pumpAndSettle();
// 
  //   // Verify the 'Acceder' button is present
  //   expect(find.byKey(const Key('Acceder')), findsOneWidget);
// 
  //   // Tap the 'Acceder' button
  //   await tester.tap(find.byKey(const Key('Registrarse')));
  //   await tester.pumpAndSettle();
// 
  //   // Verify the email and password fields are present
  //   expect(find.byKey(const Key('NombreUsuario')), findsOneWidget,
  //       reason: "Email field not found");
  //   expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget,
  //       reason: "Email field not found");
  //   expect(find.byKey(const Key('pass')), findsOneWidget,
  //       reason: "Password field not found");
  //   expect(find.byKey(const Key('confPass')), findsOneWidget,
  //       reason: "Email field not found");
// 
  //   // Enter email and password
  //   await tester.enterText(find.byKey(const Key('NombreUsuario')), "Amigo1");
  //   await tester.enterText(
  //       find.byKey(const Key('CorreoRegistro')), "amigo1@gmail.com");
  //   await tester.enterText(find.byKey(const Key('pass')), "Test123!");
  //   await tester.pumpAndSettle();
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
  //   await tester.pumpAndSettle();
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   await tester.pumpAndSettle(const Duration(seconds: 1));
  //   await tester.tap(find.byKey(const Key('Registrar')));
  //   await tester.pumpAndSettle();
  //   // Verify 'Bienvenido' text is displayed
  //   expect(find.text('Bienvenido'), findsOneWidget,
  //       reason: "'Bienvenido' text not found");
// 
  //   await Future.delayed(const Duration(seconds: 5));
  // });
// 
  // testWidgets('Crear cuenta de Amigo2', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MyApp(
  //     isLoggedIn: false,
  //   ));
  //   await tester.pumpAndSettle();
// 
  //   // Verify the 'Acceder' button is present
  //   expect(find.byKey(const Key('Acceder')), findsOneWidget);
// 
  //   // Tap the 'Acceder' button
  //   await tester.tap(find.byKey(const Key('Registrarse')));
  //   await tester.pumpAndSettle();
// 
  //   // Verify the email and password fields are present
  //   expect(find.byKey(const Key('NombreUsuario')), findsOneWidget,
  //       reason: "Email field not found");
  //   expect(find.byKey(const Key('CorreoRegistro')), findsOneWidget,
  //       reason: "Email field not found");
  //   expect(find.byKey(const Key('pass')), findsOneWidget,
  //       reason: "Password field not found");
  //   expect(find.byKey(const Key('confPass')), findsOneWidget,
  //       reason: "Email field not found");
// 
  //   // Enter email and password
  //   await tester.enterText(find.byKey(const Key('NombreUsuario')), "Amigo2");
  //   await tester.enterText(
  //       find.byKey(const Key('CorreoRegistro')), "amigo2@gmail.com");
  //   await tester.enterText(find.byKey(const Key('pass')), "Test123!");
  //   await tester.pumpAndSettle();
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   await tester.enterText(find.byKey(const Key('confPass')), "Test123!");
  //   await tester.pumpAndSettle();
  //   FocusManager.instance.primaryFocus?.unfocus();
  //   await tester.pumpAndSettle(const Duration(seconds: 1));
  //   await tester.tap(find.byKey(const Key('Registrar')));
  //   await tester.pumpAndSettle();
  //   // Verify 'Bienvenido' text is displayed
  //   expect(find.text('Bienvenido'), findsOneWidget,
  //       reason: "'Bienvenido' text not found");
// 
  //   await Future.delayed(const Duration(seconds: 5));
  // });

  testWidgets('Amigo1 envia solicitud de amistad a Amigo2.',
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
    await tester.enterText(find.byKey(const Key('email')), "amigo1@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();

    // Ir a Amigos
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Amigos')));
    await tester.pumpAndSettle();

    // Click en añadir amigo
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('add_friend')));
    await tester.pumpAndSettle();

    // Ingresar nombre de amigo
    await tester.enterText(find.byKey(const Key('friend_name')), "Amigo2");
    await tester.pumpAndSettle();

    // Confirmar envio de solicitud
    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle();

    // Comprobar mensaje
    await tester.pump(Duration(seconds: 5));
    expect(find.text('Solicitud enviada a'), findsOneWidget,
        reason: "'Solicitud enviada a' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
  
  testWidgets('Enviar solicitud de amistad a un amigo.',
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
    await tester.enterText(find.byKey(const Key('email')), "amigo2@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();

    // Ir a Notificaciones
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Notificaciones')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle();

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Enviar solicitud de amistad a un amigo.',
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
    await tester.enterText(find.byKey(const Key('email')), "amigo1@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();

    // Ir a Amigos
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Amigos')));
    await tester.pumpAndSettle();

    // Click en añadir amigo
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('add_friend')));
    await tester.pumpAndSettle();

    // Ingresar nombre de amigo
    await tester.enterText(find.byKey(const Key('friend_name')), "Amigo2");
    await tester.pumpAndSettle();

    // Confirmar envio de solicitud
    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle();

    // Comprobar mensaje
    await tester.pump(Duration(seconds: 5));
    expect(find.text('No se puede enviar solicitud porque ya es tu amigo'), findsOneWidget,
        reason: "'No se puede enviar solicitud porque ya es tu amigo' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Enviar solicitud de amistad a alguien que ya se le envió solicitud.',
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
    await tester.enterText(find.byKey(const Key('email')), "amigo1@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();

    // Ir a Amigos
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Amigos')));
    await tester.pumpAndSettle();

    // Click en añadir amigo
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('add_friend')));
    await tester.pumpAndSettle();

    // Ingresar nombre de amigo
    await tester.enterText(find.byKey(const Key('friend_name')), "Amigo2");
    await tester.pumpAndSettle();

    // Confirmar envio de solicitud
    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle();

    // Comprobar mensaje
    await tester.pump(Duration(seconds: 5));
    expect(find.text('Ya le enviaste solicitud'), findsOneWidget,
        reason: "'Ya le enviaste solicitud' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets(
      'Enviar solicitud de amistad a usuario no existente Amigo1 a NoExiste.',
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
    await tester.enterText(find.byKey(const Key('email')), "amigo1@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();

    // Ir a Amigos
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Amigos')));
    await tester.pumpAndSettle();

    // Click en añadir amigo
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('add_friend')));
    await tester.pumpAndSettle();

    // Ingresar nombre de amigo
    await tester.enterText(find.byKey(const Key('friend_name')), "NoExiste");
    await tester.pumpAndSettle();

    // Confirmar envio de solicitud
    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle();

    // Comprobar mensaje
    expect(find.text('Usuario no existe'), findsOneWidget,
        reason: "'Usuario no existe' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Enviar solicitud de amistad a si mismo Amigo1 a Amigo1.',
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
    await tester.enterText(find.byKey(const Key('email')), "amigo1@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();

    // Ir a Amigos
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Amigos')));
    await tester.pumpAndSettle();

    // Click en añadir amigo
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('add_friend')));
    await tester.pumpAndSettle();

    // Ingresar nombre de amigo
    await tester.enterText(find.byKey(const Key('friend_name')), "Amigo1");
    await tester.pumpAndSettle();

    // Confirmar envio de solicitud
    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle();

    // Comprobar mensaje
    expect(
        find.text('No te puedes enviar solicitud a ti mismo'), findsOneWidget,
        reason: "'No te puedes enviar solicitud a ti mismo' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
}
