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

  testWidgets('Cambiar imagen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    
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
    await tester.pumpAndSettle();
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('ranas').last);
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Image')));
    await tester.pumpAndSettle(Duration(seconds: 4));
    expect(find.text('Artículos'), findsOneWidget,
        reason: "'Artículos' text not found");

    await Future.delayed(const Duration(seconds: 5));

  });

    testWidgets('Cambiar imagen2', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(
      isLoggedIn: false,
    ));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();
    
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
    await tester.pumpAndSettle();
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('ranas').last);
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('0')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Image')));
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(find.text('Imagen modificada correctamente'), findsOneWidget,
        reason: "'Imagen modificada correctamente' text not found");

    await Future.delayed(const Duration(seconds: 5));

  });

}
