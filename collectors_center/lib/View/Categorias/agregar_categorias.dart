//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Equipo Tacos de asada                                                 //
//   Descripción:                     Interfaz para gregar categorias                                       //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:collectors_center/Presenter/categorias.dart';
import 'package:collectors_center/View/recursos/app_with_drawer.dart';
import 'package:collectors_center/View/recursos/inicio.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AgregarCategoria extends StatefulWidget {
  const AgregarCategoria();

  @override
  State<AgregarCategoria> createState() => _AgregarCategoriaState();
}

class _AgregarCategoriaState extends State<AgregarCategoria> {
  final _nombreCategoriaController = TextEditingController();
  final _descripcionCategoriaController = TextEditingController();

  void agregar() {
    agregarCategoria(context, _nombreCategoriaController.text.trim(),
        _descripcionCategoriaController.text.trim());
  }

  @override
  void dispose() {
    _nombreCategoriaController.dispose();
    _descripcionCategoriaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Si el usuario no está autenticado, redirigirlo a la pantalla de inicio de sesión
      return const Inicio();
    }

    return AppWithDrawer(
      currentPage: "AgregarCategoria",
      content: Scaffold(
        body: Container(
          height: screenheight,
          width: screenWidth,
          color: peach,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Nueva\nCategoría',
                    style: TextStyle(
                      fontSize: 42,
                      color: brown,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "       Nombre:",
                        style: TextStyle(
                          color: brown,
                          fontSize: 22,
                        ),
                      ),
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          color: red,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: screenWidth - 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: myColor,
                      border: Border.all(color: Colors.white, width: .2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        key: const Key('nombreCategoria'),
                        maxLength: 20,
                        controller: _nombreCategoriaController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nombre',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff503a27),
                            fontSize: 20,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "       Descripción:",
                  style: TextStyle(color: brown, fontSize: 22),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: screenWidth - 50,
                    decoration: BoxDecoration(
                      color: myColor,
                      border: Border.all(color: Colors.white, width: .2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        key: const Key('descripcionCategoria'),
                        maxLength: 300,
                        controller: _descripcionCategoriaController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Descripción',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff503a27),
                            fontSize: 16,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2 * (screenheight / 14.6),
                ),
                Center(
                  child: SizedBox(
                    width: screenWidth - 200,
                    child: ElevatedButton(
                      key: const Key('Guardar'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                      ),
                      onPressed: agregar,
                      child: const Text('Guardar'),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: screenWidth - 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
