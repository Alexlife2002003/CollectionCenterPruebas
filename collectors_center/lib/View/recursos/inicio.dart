import 'package:collectors_center/View/Cuentas/ingresar.dart';
import 'package:collectors_center/View/Cuentas/Registrarse.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio();

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/images/library-bg.jpg',
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight / 11),
                Image.asset(
                  'lib/assets/images/logo.png',
                  width: screenWidth - 20,
                ),
                Container(
                  width: screenWidth - 50,
                  height: 6,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: myColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  width: screenWidth - 10,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Ingresar()),
                              );
                            },
                            child: Material(
                              key: const Key('Acceder'),
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 146,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: myColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: Center(
                                  child: Text(
                                    'Acceder',
                                    style: TextStyle(
                                        color: brown,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Registrarse()),
                              );
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                key: const Key('Registrarse'),
                                width: 146,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: brown,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                                child: Center(
                                  child: Text(
                                    'Registrarse',
                                    style: TextStyle(
                                      color: myColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight / 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
