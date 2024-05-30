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

  testWidgets('Agregar artículo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();
    // Verify the email and password fields are present
    expect(find.byKey(const Key('email')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget, reason: "Password field not found");
    // Enter email and password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Ingresar')));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Articulos')));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('El gran mundo').last);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Image')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Camera')));
    await tester.pumpAndSettle();
     // Simulate tapping the camera shutter button at coordinates (100, 200)
    await tester.tapAt(const Offset(100, 200));
    await tester.pumpAndSettle();
    // Simulate tapping the accept photo button at coordinates (300, 400)
    await tester.tapAt(const Offset(300, 400));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('nombreArticulo')), "Chaiman");
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Guardar')));
    expect(find.text('Artículo agregado exitosamente'), findsOneWidget, reason: "'Artículo agregado exitosamente' text not found");

    
    await Future.delayed(const Duration(seconds: 5));
  });  
  
  }