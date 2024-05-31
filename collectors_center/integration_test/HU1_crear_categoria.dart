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
  testWidgets('Creación de categoría correcta.', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Acceder
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();

    // Verificar campos Email y Password
    expect(find.byKey(const Key('email')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget, reason: "Password field not found");

    // Ingresar Email y Password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Pez");
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')), "La descripción de la categoría que puse.");
    await tester.pumpAndSettle(Duration(seconds: 2));
    
    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('Categoría agregada exitosamente'), findsOneWidget, reason: "'Categoría agregada exitosamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

    testWidgets('Creación Creación de categoría con nombre mayor a 20 caracteres.', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Acceder
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();

    // Verificar campos Email y Password
    expect(find.byKey(const Key('email')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget, reason: "Password field not found");

    // Ingresar Email y Password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "EsteEsUnNombreMuyLargoYPeculiar");
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')), "La descripción de la categoría que puse.");
    await tester.pumpAndSettle(Duration(seconds: 2));
    
    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('Categoría agregada exitosamente'), findsOneWidget, reason: "'Categoría agregada exitosamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Creación de categoría con descripción mayor a 300 caracteres.', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Acceder
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();

    // Verificar campos Email y Password
    expect(find.byKey(const Key('email')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget, reason: "Password field not found");

    // Ingresar Email y Password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Lobo");
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')), "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.");
    await tester.pumpAndSettle(Duration(seconds: 2));
    
    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('Categoría agregada exitosamente'), findsOneWidget, reason: "'Categoría agregada exitosamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Creación de categoría con descripción mayor a 0 y menor a 15 caracteres.', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Acceder
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();

    // Verificar campos Email y Password
    expect(find.byKey(const Key('email')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget, reason: "Password field not found");

    // Ingresar Email y Password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Mapache");
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')), "Lorem ipsum");
    await tester.pumpAndSettle(Duration(seconds: 2));
    
    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('La descripción debe contener letras y tener al menos 15 caracteres'), findsOneWidget, reason: "'Categoría agregada exitosamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });

  testWidgets('Creación de categoría con nombre ya existente.', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(isLoggedIn: false,));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('Acceder')), findsOneWidget);

    // Acceder
    await tester.tap(find.byKey(const Key('Acceder')));
    await tester.pumpAndSettle();

    // Verificar campos Email y Password
    expect(find.byKey(const Key('email')), findsOneWidget, reason: "Email field not found");
    expect(find.byKey(const Key('password')), findsOneWidget, reason: "Password field not found");

    // Ingresar Email y Password
    await tester.enterText(find.byKey(const Key('email')), "test123@gmail.com");
    await tester.enterText(find.byKey(const Key('password')), "Test123!");
    await tester.pumpAndSettle();
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('Ingresar')));

    // Ir a Categorias y añadir nueva categoría
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Categorias')));
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('AddIcon')));
    await tester.pumpAndSettle();

    // Ingresar datos de categoría
    await tester.enterText(find.byKey(const Key('nombreCategoria')), "Lobo");
    await tester.pumpAndSettle(Duration(seconds: 2));
    await tester.enterText(find.byKey(const Key('descripcionCategoria')), "La descripción de la categoría que puse.");
    await tester.pumpAndSettle(Duration(seconds: 2));
    
    // Guardar categorpia nueva
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('Guardar')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    // Comprobar mensaje
    expect(find.text('La categoría ya existe'), findsOneWidget, reason: "'Categoría agregada exitosamente' text not found");

    // Espera
    await Future.delayed(const Duration(seconds: 5));
  });
}
