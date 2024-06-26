//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Tacos de Asada                                                        //
//   Fecha:                           19/11/23                                                              //
//   Descripción:                     View para las solicitudes de amigos dentro de la aplicación           //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:collectors_center/Presenter/amigos.dart';
import 'package:collectors_center/View/recursos/app_with_drawer.dart';
import 'package:collectors_center/View/recursos/bienvenido.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:collectors_center/View/recursos/validaciones.dart';
import 'package:flutter/material.dart';

class VerSolicitudes extends StatefulWidget {
  const VerSolicitudes({Key? key}) : super(key: key);

  @override
  _VerSolicitudesState createState() => _VerSolicitudesState();
}

class _VerSolicitudesState extends State<VerSolicitudes> {
  List<String> solicitudes = [];

  @override
  void initState() {
    super.initState();
    cargarSolicitudes();
  }

  Future<void> cargarSolicitudes() async {
    final cargarsolicitudes = await obtenerSolicitudes();
    setState(() {
      solicitudes = cargarsolicitudes;
    });
  }

  @override
  Widget build(BuildContext context) {
    void aceptar(String solicitud) async {
      bool internet = await conexionInternt(context);
      if (internet) {
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
        aceptarSolicitud(solicitud).then((_) {
          cargarSolicitudes();
          Navigator.pop(context);
        });
      }
    }

    void rechazar(String solicitud) async {
      bool internet = await conexionInternt(context);
      if (internet) {
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
        rechazarSolicitud(solicitud).then((_) {
          cargarSolicitudes();
          Navigator.pop(context);
        });
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (result) async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => const Bienvenido())),
        );
      },
      child: AppWithDrawer(
        currentPage: "VerSolicitudes",
        content: Scaffold(
          backgroundColor: peach,
          body: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Notificaciones',
                    style: TextStyle(
                      fontSize: 42,
                      color: brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: solicitudes.length,
                      itemBuilder: (context, index) {
                        final solicitud = solicitudes[index];
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: myColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 20),
                                const Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      solicitud,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    const Text("Quiere ver tus colecciones.."),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          key: const Key('confirm'),
                                          onPressed: () {
                                            aceptar(solicitud);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                          child: const Text("Aceptar"),
                                        ),
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        ElevatedButton(
                                          key: const Key('reject'),
                                          onPressed: () {
                                            rechazar(solicitud);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                          child: const Text("Rechazar"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
