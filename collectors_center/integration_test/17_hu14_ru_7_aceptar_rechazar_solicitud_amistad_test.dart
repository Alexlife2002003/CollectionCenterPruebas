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

  // PRUEBAS
  testWidgets('Rechazar solicitud de amistad.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Acceder
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
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
    await tester.pumpAndSettle();
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
    
    // Esperar a que la pantalla cambie
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();
    }

    // Confirmar mensaje de envio    
    await tester.tap(find.byKey(const Key('ok')));
    await tester.pumpAndSettle();

    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Salir de cuenta
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('logout')));
    await tester.pumpAndSettle();
    
    // Esperar a que la pantalla cambie
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();
    }
    
    // Acceder
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
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
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Ir a Notificaciones
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Notificaciones')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('reject')));
    await tester.pumpAndSettle();

    await tester.pump(Duration(seconds: 5));
    expect(find.text('Amigo2'), findsNothing,
    reason: "'No se puede enviar solicitud porque ya es tu amigo' text found, but it should not be");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Aceptar solicitud de amistad.',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Acceder
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
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
    await tester.pumpAndSettle();
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
    
    // Esperar a que la pantalla cambie
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();
    }

    // Confirmar mensaje de envio    
    await tester.tap(find.byKey(const Key('ok')));
    await tester.pumpAndSettle();

    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Salir de cuenta
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('logout')));
    await tester.pumpAndSettle();
    
    // Esperar a que la pantalla cambie
    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();
    }
    
    // Acceder
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
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
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Ir a Notificaciones
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Notificaciones')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('confirm')));
    await tester.pumpAndSettle();

    await tester.pump(Duration(seconds: 5));
    expect(find.text('Amigo2'), findsNothing,
    reason: "'No se puede enviar solicitud porque ya es tu amigo' text found, but it should not be");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
}