import 'package:collectors_center/Presenter/categorias.dart';
import 'package:collectors_center/View/Categorias/agregar_categorias.dart';
import 'package:collectors_center/View/Categorias/editar_categoria.dart';
import 'package:collectors_center/View/recursos/bienvenido.dart';
import 'package:collectors_center/View/recursos/inicio.dart';
import 'package:collectors_center/View/recursos/utils.dart';
import 'package:collectors_center/View/recursos/validaciones.dart';
import 'package:flutter/material.dart';
import 'package:collectors_center/View/recursos/app_with_drawer.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerCategorias extends StatefulWidget {
  const VerCategorias({Key? key}) : super(key: key);

  @override
  _VerCategoriasState createState() => _VerCategoriasState();
}

class _VerCategoriasState extends State<VerCategorias> {
  bool isEdit = false;
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    conexionInternt(context);
    loadCategories();
  }

  Future<void> loadCategories() async {
    final loadedCategories = await fetchCategories();
    setState(() {
      categories = loadedCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Inicio();
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (result) async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Bienvenido()),
        );
      },
      child: AppWithDrawer(
        currentPage: "Categorias",
        content: Scaffold(
          backgroundColor: peach,
          body: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTitle(),
                  const SizedBox(height: 20),
                  buildIconsRow(),
                  const SizedBox(height: 20),
                  buildCategoriesList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'Categorías',
      style: TextStyle(
        fontSize: 42,
        color: brown,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: toggleEditMode,
          icon: Icon(
            isEdit && categories.isNotEmpty
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
              MaterialPageRoute(builder: (context) => const AgregarCategoria()),
            );
          },
          icon: const Icon(
            Icons.add_circle_outline,
            size: 60,
          ),
        )
      ],
    );
  }

  Widget buildCategoriesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return buildCategoryItem(category);
        },
      ),
    );
  }

  Widget buildCategoryItem(String category) {
    return GestureDetector(
      onTap: () => handleCategoryTap(category),
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(2, 2))
          ],
          color: myColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          title: Text(
            category,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(
            isEdit ? Icons.delete : Icons.edit,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Future<void> toggleEditMode() async {
    bool internet = await conexionInternt(context);
    if (internet) {
      setState(() {
        if (categories.isNotEmpty) {
          isEdit = !isEdit;
        } else {
          showSnackbar(context, "No existen categorías", red);
        }
      });
    }
  }

  Future<void> handleCategoryTap(String category) async {
    bool internet = await conexionInternt(context);
    if (internet) {
      if (isEdit) {
        await borrar(category);
        setState(() {
          isEdit = false;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditarCategoria(categoryName: category),
          ),
        );
      }
    }
  }

  Future<void> borrar(String categoria) async {
    bool confirmacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: peach,
          title: const Text('Confirmar eliminación'),
          content: Text(
              '¿Está seguro de que desea borrar la categoría "$categoria"?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
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
      await eliminarCategoria(context, categoria.trim(), true);
      loadCategories();
      Navigator.pop(context);
    }
  }
}
