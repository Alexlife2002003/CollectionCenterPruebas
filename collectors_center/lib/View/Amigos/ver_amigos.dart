//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Tacos de Asada                                                        //
//   Fecha:                           19/11/23                                                              //
//   Descripción:                     View de los amigos dentro de la aplicación                           //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:collectors_center/View/Amigos/ver_colecciones_amigos.dart';
import 'package:collectors_center/View/recursos/validaciones.dart';
import 'package:flutter/material.dart';
import 'package:collectors_center/Presenter/amigos.dart';
import 'package:collectors_center/View/recursos/app_with_drawer.dart';
import 'package:collectors_center/View/recursos/bienvenido.dart';
import 'package:collectors_center/View/recursos/colors.dart';

class VerAmigos extends StatefulWidget {
  const VerAmigos({Key? key}) : super(key: key);

  @override
  State<VerAmigos> createState() => _VerAmigosState();
}

class _VerAmigosState extends State<VerAmigos> {
  List<String> amigos = [];
  String userInput = '';

  void enviarSolicitud() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: brown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            'Inserta el nombre del usuario que quieres añadir a amigos',
            style: TextStyle(color: myColor),
          ),
          content: TextField(
            key: const Key('friend_name'),
            onChanged: (value) {
              setState(() {
                userInput = value;
              });
            },
            decoration: InputDecoration(
              fillColor: peach,
              filled: true,
              hintText: 'Nombre de Usuario',
              hintStyle: const TextStyle(fontWeight: FontWeight.bold),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          actions: <Widget>[
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  key: const Key('confirm'),
                  onPressed: () {
                    sendSolicitud(userInput.trim()).then((int cumplido) {
                      Navigator.of(context).pop();
                      String message = "";
                      switch (cumplido) {
                        case 0:
                          message =
                              "No se puede enviar solicitud porque ya es tu amigo";
                          break;
                        case 1:
                          message = "Ya le enviaste solicitud";
                          break;
                        case 2:
                          message = "No te puedes enviar solicitud a ti mismo";
                          break;
                        case 3:
                          message = "Error al enviar la solicitud";
                          break;
                        case 4:
                          message = "Usuario no existe";
                          break;
                        case 10:
                          message = userInput;
                          break;
                      }
                      showDialogSendSolicitud(context, cumplido, message);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showDialogSendSolicitud(
      BuildContext context, int cumplido, String message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: cumplido == 10
              ? Icon(
                  Icons.check_circle_outline,
                  color: green,
                  size: 40,
                )
              : Icon(
                  Icons.error,
                  color: red,
                  size: 40,
                ),
          backgroundColor: brown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            cumplido == 10 ? 'Solicitud enviada a' : message,
            style: TextStyle(
              color: cumplido == 10 ? myColor : red,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(
            cumplido == 10 ? userInput : '',
            style: TextStyle(color: peach),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                key: const Key('ok'),
                onPressed: () {
                  userInput = "";
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    cargarAmigos();
  }

  Future<void> cargarAmigos() async {
    final cargaramigos = await obtenerAceptados();
    setState(() {
      amigos = cargaramigos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (result) async {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const Bienvenido())));
      },
      child: AppWithDrawer(
        currentPage: "verAmigos",
        content: Scaffold(
          backgroundColor: peach,
          body: Column(
            children: <Widget>[
              Container(
                color: peach,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Amigos',
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: peach,
                                  title: const Text(
                                    'Aviso',
                                    textAlign: TextAlign.center,
                                  ),
                                  content: const Text(
                                    'Esta funcionalidad se realizará a futuro, no forma parte de esta iteración.',
                                    textAlign: TextAlign.justify,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 60,
                          ),
                        ),
                        IconButton(
                          key: const Key('add_friend'),
                          onPressed: () async {
                            bool internet = await conexionInternt(context);
                            if (internet) {
                              enviarSolicitud();
                            }
                          },
                          icon: const Icon(
                            Icons.person_add_alt_1_outlined,
                            size: 60,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: amigos.length,
                  itemBuilder: (context, index) {
                    final solicitud = amigos[index];
                    return GestureDetector(
                      key: Key('$index'),
                      onTap: () async {
                        bool internet = await conexionInternt(context);
                        if (internet) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      VerColeccionesAmigos(amigo: solicitud))));
                        }
                      },
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
                                const Text("\nColecciones"),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            const Icon(
                              Icons.visibility_outlined,
                              size: 40,
                            ),
                            const SizedBox(
                              width: 20,
                            )
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
    );
  }
}
