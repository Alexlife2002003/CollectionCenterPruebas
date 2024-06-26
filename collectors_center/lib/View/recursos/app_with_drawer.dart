import 'package:collectors_center/Presenter/amigos.dart';
import 'package:collectors_center/Presenter/categorias.dart';
import 'package:collectors_center/Presenter/cuentas.dart';
import 'package:collectors_center/View/Amigos/ver_amigos.dart';
import 'package:collectors_center/View/Amigos/ver_solicitudes.dart';
import 'package:collectors_center/View/Categorias/ver_categorias.dart';
import 'package:collectors_center/View/Objects/ver_objetos.dart';
import 'package:collectors_center/View/Cuentas/perfil.dart';
import 'package:collectors_center/View/recursos/bienvenido.dart';

import 'package:collectors_center/View/recursos/colors.dart';
import 'package:collectors_center/View/recursos/custom_badge.dart';
import 'package:collectors_center/View/recursos/utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppWithDrawer extends StatefulWidget {
  final Widget content;
  String currentPage;

  AppWithDrawer({required this.content, required this.currentPage});

  @override
  _AppWithDrawerState createState() => _AppWithDrawerState();
}

class _AppWithDrawerState extends State<AppWithDrawer> {
  late List<String> listCategories;
  late List<String> listSolicitudes;
  int totalSolicitudes = 0;

  @override
  void initState() {
    super.initState();
    listCategories = [];
    listSolicitudes = [];
    getCategories();
    getSolicitudes();
  }

  Future<void> getCategories() async {
    listCategories = await fetchCategories();
  }

  Future<void> getSolicitudes() async {
    listSolicitudes = await obtenerSolicitudes();
    setState(() {
      totalSolicitudes = listSolicitudes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: peach,
        elevation: 0,
        iconTheme: IconThemeData(color: brown),
        actions: [
          IconButton(
            key: Key('Perfil'),
            onPressed: () {
              if (widget.currentPage != "Perfil") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Perfil(),
                  ),
                );
              }
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: brown,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 180,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: brown,
                ),
                child: InkWell(
                  onTap: () {
                    if (widget.currentPage != "Bienvenido") {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const Bienvenido(),
                        ),
                        (route) => false,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Collectors Center',
                        style: TextStyle(
                          color: Color(0xFFFFEDBD),
                          fontSize: 34,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Image.asset("lib/assets/images/home_icon.png"),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Inicio',
                      style: TextStyle(color: Colors.white, fontSize: 33)),
                ],
              ),
              onTap: () async {
                await getCategories();
                if (widget.currentPage != "Bienvenido") {
                  widget.currentPage = "Bienvenido";
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const Bienvenido(),
                    ),
                    (route) => false,
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              key: const Key('Articulos'),
              title: Row(
                children: [
                  Image.asset("lib/assets/images/Articles_icon.png"),
                  const SizedBox(
                    width: 14,
                  ),
                  const Text('Artículos',
                      style: TextStyle(color: Colors.white, fontSize: 33)),
                ],
              ),
              onTap: () async {
                await getCategories();
                if (listCategories.isNotEmpty) {
                  if (widget.currentPage != "Objetos") {
                    widget.currentPage = "Objetos";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const VerObjectsCategoria(
                                  categoria: "",
                                ))));
                  } else {
                    Navigator.pop(context);
                  }
                } else {
                  showSnackbar(context, "No se han creado categorías", red);
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              key: const Key('Categorias'),
              title: Row(
                children: [
                  Image.asset("lib/assets/images/Categories_icon.png"),
                  const SizedBox(
                    width: 18,
                  ),
                  const Text(
                    'Categorías',
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                ],
              ),
              onTap: () async {
                await getCategories();
                if (widget.currentPage != "Categorias") {
                  widget.currentPage = "Categorias";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerCategorias()),
                  );
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
                key: const Key('Amigos'),
                title: const Row(
                  children: [
                    Icon(Icons.person_add_alt_outlined,
                        color: Colors.white, size: 30),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Amigos',
                      style: TextStyle(color: Colors.white, fontSize: 33),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const VerAmigos())));
                }),
            ListTile(
                key: const Key('Notificaciones'),
                title: Row(
                  children: [
                    CustomBadge(
                      icon: const Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                        size: 30,
                      ),
                      badgeValue: totalSolicitudes,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Notificaciones',
                      style: TextStyle(color: Colors.white, fontSize: 33),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const VerSolicitudes())));
                }),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: GestureDetector(
                onTap: () {
                  cerrarSesion(context);
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: screenWidth - 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: myColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 2),
                    ),
                    child: const Center(
                      key: const Key('logout'),
                      child: Text(
                        'Cerrar sesión',
                        style: TextStyle(
                          color: Color(0xFF40342A),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
      body: widget.content,
    );
  }
}
