//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Equipo Tacos de asada                                                 //
//   Descripción:                     Ver los objetos                                                       //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'package:collectors_center/Presenter/categorias.dart';
import 'package:collectors_center/View/Objects/agregar_objetos.dart';
import 'package:collectors_center/View/Objects/editar_objetos.dart';
import 'package:collectors_center/View/recursos/bienvenido.dart';
import 'package:collectors_center/View/recursos/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:collectors_center/View/recursos/app_with_drawer.dart';
import 'package:collectors_center/View/recursos/inicio.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:collectors_center/Presenter/objects.dart';

String imageUrlKey = 'Image URL';

class MyObject {
  String imageUrl;
  bool isSelected;

  MyObject({
    required this.imageUrl,
    this.isSelected = false,
  });

  factory MyObject.fromMap(Map<String, dynamic> map) {
    return MyObject(
      imageUrl: map[imageUrlKey],
    );
  }
}

class VerObjectsCategoria extends StatefulWidget {
  final String categoria;

  const VerObjectsCategoria({ required this.categoria});

  @override
  _VerObjectsCategoriaState createState() => _VerObjectsCategoriaState();
}

class _VerObjectsCategoriaState extends State<VerObjectsCategoria> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<MyObject> _objectList = [];
  List<MyObject> _selectedObjects = [];
  bool deleteActivated = false;
  String selectedCategory = 'Default';
  List<String> categories = [];
  String selectedDescription = "";

  @override
  void initState() async {
    super.initState();
    await _fetchObjects();
    await _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    List<String> fetchedCategories = [];

    try {
      fetchedCategories = await fetchCategories();
    } catch (e) {
      showSnackbar(context, "Error al buscar categorías", red);
    }

    setState(() async {
      categories = fetchedCategories;
      if (categories.isNotEmpty && widget.categoria.isEmpty) {
        selectedCategory = categories[0];
        await _fetchObjects();
      } else if (widget.categoria.isNotEmpty) {
        selectedCategory = widget.categoria;
        await _fetchObjects();
      } else {
        selectedCategory = 'Sin categorias';
      }
    });
  }

  Future<void> _fetchObjects() async {
    try {
      final List<Map<String, dynamic>> objects =
          await fetchObjectsByCategory(selectedCategory);
      selectedDescription = await fetchDescriptions(selectedCategory);

      final List<MyObject> myObjects = objects.map((object) {
        return MyObject.fromMap(object);
      }).toList();

      setState(() {
        _objectList = myObjects;
      });
    } catch (error) {
      showSnackbar(context, "Error al obtener categorías", red);
    }
  }

  void _toggleSelection(MyObject myObject) {
    setState(() {
      myObject.isSelected = !myObject.isSelected;
      if (myObject.isSelected) {
        _selectedObjects.add(myObject);
      } else {
        _selectedObjects.remove(myObject);
      }
    });
  }

  void _deleteConfirmation() async {
    bool confirmacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: peach,
          title: const Text('Confirmar eliminación'),
          content: const Text(
              '¿Está seguro de que desea borrar los artículos seleccionados?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                setState(() {
                  deleteActivated = !deleteActivated;
                });
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Eliminar',
                style: TextStyle(color: red),
              ),
            ),
          ],
        );
      },
    );

    if (confirmacion == true) {
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
      _deleteSelectedObjects();
    }
  }

  void _deleteSelectedObjects() async {
    try {
      for (MyObject selectedObject in _selectedObjects) {
        if (_selectedObjects.isNotEmpty) {
          await eliminarVariosObjetos(
              context, selectedObject.imageUrl, widget.categoria);
        }
      }
      showSnackbar(context, "Los artículos han sido eliminados", green);
      Navigator.pop(context);
    } catch (e) {
      showSnackbar(context, "Los artículos no han sido eliminados", red);
      Navigator.pop(context);
    }
    setState(() {
      _objectList.removeWhere((object) => object.isSelected);
      _selectedObjects.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Inicio();
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Bienvenido()),
        );
        return true;
      },
      child: AppWithDrawer(
        currentPage: "Objetos",
        content: Scaffold(
          backgroundColor: peach,
          body: Column(
            children: <Widget>[
              Container(
                color: peach,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Artículos',
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
                            if (deleteActivated) {
                              setState(() {
                                deleteActivated = !deleteActivated;
                              });
                              if (_selectedObjects.isNotEmpty) {
                                _deleteConfirmation();
                              }
                            } else {
                              if (_objectList.isNotEmpty) {
                                setState(() {
                                  deleteActivated = !deleteActivated;
                                });
                              }
                            }
                          },
                          icon: Icon(
                            deleteActivated
                                ? Icons.check_circle_outlined
                                : Icons.delete,
                            size: 60,
                          ),
                        ),
                        IconButton(
                          key: const Key('AddIcon'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        AgregarObjectsCategoria(
                                            categoria: selectedCategory))));
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: screenWidth - 150,
                            height: 50,
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: myColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: DropdownButton<String>(
                                value: selectedCategory,
                                onChanged: (String? newValue) {
                                  setState(() async {
                                    selectedCategory = newValue!;
                                    await _fetchObjects();
                                  });
                                },
                                items: categories.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  );
                                }).toList(),
                                dropdownColor: myColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (selectedDescription.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: screenWidth - 50,
                          decoration: BoxDecoration(
                            color: myColor,
                            border: Border.all(color: peach, width: .2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              selectedDescription,
                              style: TextStyle(color: brown, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              // Object listing
              Expanded(
                child: ListView(
                  children: <Widget>[
                    if (_objectList.isEmpty)
                      Center(
                        child: Container(
                          color: peach,
                        ),
                      )
                    else
                      Column(
                        children: <Widget>[
                          for (int i = 0; i < _objectList.length; i += 2)
                            _buildObjectRow(
                                _objectList[i],
                                i + 1 < _objectList.length
                                    ? _objectList[i + 1]
                                    : null,
                                Key(i.toString()),
                                Key((i + 1).toString())),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildObjectRow(
  MyObject object1,
  MyObject? object2,
  Key keyobject1,
  Key keyobject2,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        _buildObjectCard(object1, keyobject1),
        if (object2 != null) const SizedBox(width: 8),
        if (object2 != null) _buildObjectCard(object2, keyobject2),
      ],
    ),
  );
}

Widget _buildObjectCard(MyObject object, Key key) {
  final String imageUrl = object.imageUrl;

  return Expanded(
    child: Container(
      color: peach,
      child: Card(
        elevation: 3,
        child: Stack(
          children: [
            Container(
              color: peach,
              child: FutureBuilder(
                future: storage.ref().child(imageUrl).getDownloadURL(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(color: peach);
                  } else if (snapshot.hasError) {
                    return Text('Error loading image');
                  } else {
                    final imageUrl = snapshot.data.toString();
                    return GestureDetector(
                      onTap: () {
                        if (deleteActivated) {
                          _toggleSelection(object);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditarObjetos(
                                url: imageUrl,
                                firebaseURL: object.imageUrl,
                              ),
                            ),
                          );
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.blue,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(2, 2),
                                )
                              ],
                            ),
                            child: CachedNetworkImage(
                              key: key,
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              width: 188,
                              height: 188,
                            ),
                          ),
                          if (object.isSelected)
                            const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 24,
                              ),
                            ),
                        ],
                      ),
                    );
                  }
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
