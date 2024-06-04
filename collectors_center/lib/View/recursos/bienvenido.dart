//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Equipo Tacos de asada                                                 //
//   Fecha:                           25/09/23                                                              //
//   Descripción:                     Pantalla de bienvida despues de registrarse o iniciar sesión          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:collectors_center/View/recursos/inicio.dart';
import 'package:collectors_center/View/recursos/validaciones.dart';
import 'package:flutter/material.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:collectors_center/View/recursos/app_with_drawer.dart';

class Bienvenido extends StatelessWidget {
  const Bienvenido();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Si el usuario no está autenticado, redirigirlo a la pantalla de inicio de sesión
      return const Inicio();
    }

    conexionInternt(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (result) {},
      child: AppWithDrawer(
        currentPage: "Bienvenido",
        content: Container(
          color: peach,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Bienvenido',
                  key: const Key('Bienvenido'),
                  style: TextStyle(
                      fontSize: 60, color: brown, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Image.asset(
                  'lib/assets/images/logo.png',
                  width: screenWidth - 50,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
