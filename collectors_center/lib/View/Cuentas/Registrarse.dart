//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Tacos de Asada                                                        //
//   Fecha:                           25/09/23                                                              //
//   Descripción:                     Vista de registro de nuevos usuarios                                  //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:collectors_center/Presenter/cuentas.dart';

class Registrarse extends StatefulWidget {
  const Registrarse();

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final _nombreUsuarioController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  //Crea todos los textfields para recibir los datos
  Widget buildInputField(String hintText, TextEditingController controller,
      bool obscureText, TextInputType inputType, double screenWidth, Key key2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          key: key2,
          controller: controller,
          obscureText: obscureText,
          keyboardType: inputType,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: myColor),
              borderRadius: BorderRadius.circular(12.0),
            ),
            labelText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 24,
            ),
            labelStyle: TextStyle(color: peach),
            filled: true,
            fillColor: Colors.grey.withOpacity(.8),
          ),
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nombreUsuarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    ///Se comunica con el presentador para registrarse
    void registrarse() {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: peach,
            ),
          );
        },
      );
      registrarUsuario(
          context,
          _nombreUsuarioController.text.trim(),
          _emailController.text,
          _passwordController.text.trim(),
          _confirmPasswordController.text.trim());
    }

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/library-bg.jpg',
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenheight,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 55,
                ),
                Center(
                  child: Image.asset(
                    'lib/assets/images/Usuario.png',
                    width: screenWidth - 160,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildInputField(
                  'Nombre de Usuario',
                  _nombreUsuarioController,
                  false,
                  TextInputType.text,
                  screenWidth,
                  const ValueKey('NombreUsuario'),
                ),
                const SizedBox(
                  height: 15,
                ),
                buildInputField(
                    'Correo Electrónico',
                    _emailController,
                    false,
                    TextInputType.emailAddress,
                    screenWidth,
                    const Key('CorreoRegistro')),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      key: const ValueKey('pass'),
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: _passwordVisible
                              ? peach
                              : const Color.fromARGB(255, 95, 95, 95),
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: myColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: 'Contraseña',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        labelStyle: TextStyle(color: peach),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.8),
                      ),
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      key: const ValueKey('confPass'),
                      controller: _confirmPasswordController,
                      obscureText: !_confirmPasswordVisible,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: _confirmPasswordVisible
                              ? peach
                              : const Color.fromARGB(255, 95, 95, 95),
                          icon: Icon(_confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _confirmPasswordVisible =
                                  !_confirmPasswordVisible;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: myColor),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: 'Confirmar contraseña',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        labelStyle: TextStyle(color: peach),
                        filled: true,
                        fillColor: Colors.grey.withOpacity(.8),
                      ),
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    key: const ValueKey('Registrar'),
                    onTap: registrarse,
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: screenWidth - 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: myColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Center(
                            child: Text(
                          'Registrar',
                          style: TextStyle(
                            color: brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: screenWidth - 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: brown,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white, width: 2)),
                        child: Center(
                            child: Text(
                          'Regresar',
                          style: TextStyle(
                            color: myColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
