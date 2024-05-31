import 'package:collectors_center/View/recursos/Inicio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../test_firebase_setup.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized(); Gets called in setupFirebaseAuthMocks()
  setupFirebaseAuthMocks();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  group('Inicio Widget Tests', () {
    testWidgets('Initial state and text fields are displayed correctly',
        (WidgetTester tester) async {
      // Build our widget.
      await tester.pumpWidget(const MaterialApp(
        home: Inicio(),
      ));

      expect(find.byKey(const Key('Acceder')), findsOneWidget);
      expect(find.byKey(const Key('Registrarse')), findsOneWidget);
      expect(find.text('Registrarse'), findsOneWidget);
    });
  });
}
