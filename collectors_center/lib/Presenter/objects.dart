//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Tacos De Asada                                                        //
//   Fecha:                           29/09/23                                                              //
//   Descripción:                     Permite hacer operaciones sobre los objetos                           //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:collectors_center/View/Objects/ver_objetos.dart';
import 'package:collectors_center/View/recursos/colors.dart';
import 'package:collectors_center/View/recursos/utils.dart';
import 'package:collectors_center/View/recursos/validaciones.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Método encargado de realizar la descripción del artículo.
Future<void> editarDescripcion(
    BuildContext context, String imageUrl, String description) async {
  bool internet = await conexionInternt(context);
  if (internet == false) {
    return;
  }
  final containsLetter = RegExp(r'[a-zA-Z]').hasMatch(description);

  if (description.length < 10 && description.isNotEmpty) {
    showSnackbar(context,
        "Descripción debe contener mínimo 10 caracteres si no es vacia", red);
    return;
  }

  if (!containsLetter && description.isNotEmpty) {
    showSnackbar(context, "Descripción debe contener letras", red);
    return;
  }
  editarDescripcionLogic(context, imageUrl, description);
}

Future<void> editarDescripcionLogic(
    BuildContext context, String imageUrl, String description) async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    final userDocSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();

    if (!userDocSnapshot.exists) {
      return;
    }

    final categoriesQuerySnapshot =
        await userDocSnapshot.reference.collection('Categories').get();

    await _updateDescription(
        context, imageUrl, description, categoriesQuerySnapshot.docs);
  } catch (e) {
    showSnackbar(context, "No es posible guardar los cambios", red);
  }
}

Future<void> _updateDescription(
  BuildContext context,
  String imageUrl,
  String description,
  List<DocumentSnapshot> categoriesDocs,
) async {
  for (final categoryDoc in categoriesDocs) {
    final objectsQuerySnapshot = await categoryDoc.reference
        .collection('Objects')
        .where('Image_url', isEqualTo: imageUrl)
        .get();

    for (final objectDoc in objectsQuerySnapshot.docs) {
      final category = categoryDoc['Name'];
      final objectName = objectDoc['Name'];

      if (category == description) {
        showSnackbar(context,
            "Descripción no puede ser igual al nombre de la categoría", red);
        return;
      }
      if (objectName == description) {
        showSnackbar(context,
            "Descripción no puede ser igual al nombre del artículo", red);
        return;
      }

      await objectDoc.reference.update({'Description': description});

      showSnackbar(context, "Se han guardado los cambios", green);
      return;
    }
  }
}

// Método encargado de eliminar la descripción de un artículo y dejar vacío el campo de descripción
Future<void> eliminarDescripcion(
    BuildContext context, String imageUrl, String description) async {
  bool internet = await conexionInternt(context);
  if (internet == false) {
    return;
  }
  eliminarDescripcionLogic(context, imageUrl, description);
}

Future<void> eliminarDescripcionLogic(
    BuildContext context, String imageUrl, String description) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Reference to the user's "Users" collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      // Query for the user's document
      DocumentSnapshot userDocSnapshot =
          await usersCollection.doc(user.uid).get();

      if (userDocSnapshot.exists) {
        // Reference to the "Categories" subcollection within the user's document
        CollectionReference categoriesCollection =
            userDocSnapshot.reference.collection('Categories');

        // Query all category documents
        QuerySnapshot categoriesQuerySnapshot =
            await categoriesCollection.get();

        // Loop through the category documents
        for (final categoryDoc in categoriesQuerySnapshot.docs) {
          // Reference to the "Objects" subcollection within the category document
          CollectionReference objectsCollection =
              categoryDoc.reference.collection('Objects');

          // Query all documents within the "Objects" subcollection
          QuerySnapshot objectsQuerySnapshot = await objectsCollection.get();

          // Loop through the objects in the category
          for (final objectDoc in objectsQuerySnapshot.docs) {
            // Check if the image URL matches the desired URL
            if (objectDoc['Image_url'] == imageUrl) {
              // Update the "Description" field to be blank ("")
              await objectDoc.reference.update({'Description': description});

              // You can show a success message here if needed
              showSnackbar(context, "Descripción borrada exitosamente", green);

              // Exit the function after successfully clearing the description
              return;
            }
          }
        }
      }
    }
  } catch (e) {
    showSnackbar(context, "La descripción no se ha eliminado", red);
  }
}

//Funcionalidad de agregar objeto a categoría
void agregarObjeto(
  BuildContext context,
  String url,
  String name,
  String descripcion,
  String categoria,
  String mensajeExito,
  String mensajeError,
) async {
  bool internet = await conexionInternt(context);
  if (!internet) return;

  if (!validarNombre(context, name)) return;
  if (!validarDescripcionUna(context, descripcion, name, categoria)) return;
  if (!validarDescripcionDos(context, descripcion, name, categoria)) return;

  agregarObjetoLogic(
      context, url, name, descripcion, categoria, mensajeExito, mensajeError);
}

bool validarNombre(BuildContext context, String name) {
  if (name.trim().isEmpty) {
    showSnackbar(context, "El nombre del artículo no puede ir vacío", red);
    return false;
  }
  return true;
}

bool validarDescripcionDos(
    BuildContext context, String descripcion, String name, String categoria) {
  final containsLetter = RegExp(r'[a-zA-Z]').hasMatch(descripcion);
  if (descripcion.isNotEmpty && descripcion.length < 10) {
    showSnackbar(
        context, "La descripción debe contener al menos 10 caracteres", red);
    return false;
  }

  if (descripcion.length > 300) {
    showSnackbar(
        context, "La descripción no puede exceder los 300 caracteres", red);
    return false;
  }

  if (!containsLetter && descripcion.isNotEmpty) {
    showSnackbar(context, "La descripción debe contener letras", red);
    return false;
  }

  return true;
}

bool validarDescripcionUna(
    BuildContext context, String descripcion, String name, String categoria) {
  if (name == categoria) {
    showSnackbar(context, "No puede llevar el nombre de la categoría", red);
    return false;
  }
  if (descripcion == name) {
    showSnackbar(
        context, "Descripción no puede ser igual al nombre del artículo", red);
    return false;
  }

  if (descripcion == categoria) {
    showSnackbar(context,
        "Descripción no puede ser igual al nombre de la categoría", red);
    return false;
  }

  return true;
}

Future<void> agregarObjetoLogic(
    BuildContext context,
    String url,
    String name,
    String descripcion,
    String categoria,
    String mensajeExito,
    String mensajeError) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user = auth.currentUser;
  if (user != null) {
    String uid = user.uid;
    DocumentReference usersDoc = firestore.collection('Users').doc(uid);
    CollectionReference categoriasCollection =
        usersDoc.collection('Categories');

    // Check if the category name already exists
    QuerySnapshot categoryQuery =
        await categoriasCollection.where('Name', isEqualTo: categoria).get();

    if (categoryQuery.docs.isNotEmpty) {
      // Category name exists, so add the object to the subcollection
      DocumentReference categoryDoc = categoryQuery.docs.first.reference;
      CollectionReference categoriaSubcollection =
          categoryDoc.collection('Objects');

      // Add the object data to the subcollection
      await categoriaSubcollection.add({
        'Name': name,
        'Image_url': url,
        'Description': descripcion,
        'timestamp': FieldValue.serverTimestamp(),
      });
      showSnackbar(context, mensajeExito, green);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerObjectsCategoria(categoria: categoria)),
      );
    } else {
      showSnackbar(context, mensajeError, red);
    }
  } else {
    showSnackbar(context, "No estas logeado", red);
  }
}

// Permite obtener los objetos por categoría
Future<List<Map<String, dynamic>>> fetchObjectsByCategory(
    String categoryName) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user = auth.currentUser;
  if (user != null) {
    String uid = user.uid;
    DocumentReference usersDoc = firestore.collection('Users').doc(uid);
    CollectionReference categoriasCollection =
        usersDoc.collection('Categories');

    // Query the category by name
    QuerySnapshot categoryQuery =
        await categoriasCollection.where('Name', isEqualTo: categoryName).get();

    if (categoryQuery.docs.isNotEmpty) {
      // Category exists, retrieve its reference
      DocumentSnapshot categoryDoc = categoryQuery.docs.first;
      CollectionReference categoriaSubcollection =
          categoriasCollection.doc(categoryDoc.id).collection('Objects');

      // Query the objects in the subcollection
      QuerySnapshot objectsQuery = await categoriaSubcollection.get();

      // Process the objects and collect them into a list of maps
      List<Map<String, dynamic>> objectList = [];
      for (QueryDocumentSnapshot doc in objectsQuery.docs) {
        Map<String, dynamic> objectData = doc.data() as Map<String, dynamic>;
        String name = objectData['Name'];
        String imageUrl = objectData['Image_url'];
        String description = objectData['Description'];

        // Create a map representation of the object and add it to the list
        Map<String, dynamic> objectInfo = {
          'Name': name,
          'Image URL': imageUrl,
          'Description': description,
        };
        objectList.add(objectInfo);
      }

      return objectList;
    } else {
      // Category doesn't exist
      return [];
    }
  } else {
    // User not logged in
    return [];
  }
}

// Permite obtener informacion de la imagen a traves del url
Future<Map<String, String>> obtenerObjeto(
    BuildContext context, String imageUrl) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Reference to the user's "Users" collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      // Query for the user's document
      DocumentSnapshot userDocSnapshot =
          await usersCollection.doc(user.uid).get();

      if (userDocSnapshot.exists) {
        // Reference to the "Categories" subcollection within the user's document
        CollectionReference categoriesCollection =
            userDocSnapshot.reference.collection('Categories');

        // Query all category documents
        QuerySnapshot categoriesQuerySnapshot =
            await categoriesCollection.get();

        // Loop through the category documents
        for (final categoryDoc in categoriesQuerySnapshot.docs) {
          // Reference to the "Objects" subcollection within the category document
          CollectionReference objectsCollection =
              categoryDoc.reference.collection('Objects');
          final categoryName = categoryDoc['Name'];

          // Query all documents within the "Objects" subcollection
          QuerySnapshot objectsQuerySnapshot = await objectsCollection.get();
          // Loop through the objects in the category
          for (final objectDoc in objectsQuerySnapshot.docs) {
            // Check if the image URL matches the desired URL
            if (objectDoc['Image_url'] == imageUrl) {
              // Extract image information (Name and Description)
              final imageName = objectDoc['Name'];
              final imageDescription = objectDoc['Description'];

              // Return the image information as a Map
              return {
                'imageName': imageName,
                'imageDescription': imageDescription,
                'imageCategory': categoryName
              };
            }
          }
        }
      }
    }
  } catch (e) {
    showSnackbar(context, "Error al buscar la imagen", red);
  }

  // Return an empty Map if no matching image URL was found or there's an error
  return {'imageName': '', 'imageDescription': '', 'imageCategory': ''};
}

// Permite borrar los objetos por categoría
Future<void> eliminarObjeto(
    BuildContext context, String imageUrl, String category) async {
  await deleteImageByImageUrl(context, imageUrl);

  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => VerObjectsCategoria(categoria: category)),
  );
}

//Se usa para borrar mas de un objeto
Future<void> eliminarVariosObjetos(
    BuildContext context, String imageUrl, String category) async {
  await deleteImageByImageUrlNoMessage(context, imageUrl);
}

//borra imagen en base a url
Future<void> deleteImageByImageUrl(
    BuildContext context, String imageUrl) async {
  bool internet = await conexionInternt(context);

  if (internet == false) {
    return;
  }
  deleteImageByImageUrlLogic(context, imageUrl);
}

Future<void> deleteImageByImageUrlLogic(
    BuildContext context, String imageUrl) async {
  try {
    final storageRef = FirebaseStorage.instance.ref();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Reference to the user's "Users" collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      // Query for the user's document
      DocumentSnapshot userDocSnapshot =
          await usersCollection.doc(user.uid).get();

      if (userDocSnapshot.exists) {
        // Reference to the "Categories" subcollection within the user's document
        CollectionReference categoriesCollection =
            userDocSnapshot.reference.collection('Categories');

        // Query all category documents
        QuerySnapshot categoriesQuerySnapshot =
            await categoriesCollection.get();

        // Loop through the category documents
        for (final categoryDoc in categoriesQuerySnapshot.docs) {
          // Reference to the "Objects" subcollection within the category document
          CollectionReference objectsCollection =
              categoryDoc.reference.collection('Objects');

          // Query all documents within the "Objects" subcollection
          QuerySnapshot objectsQuerySnapshot = await objectsCollection.get();

          // Loop through the objects in the category
          for (final objectDoc in objectsQuerySnapshot.docs) {
            // Check if the image URL matches the desired URL
            if (objectDoc['Image_url'] == imageUrl) {
              // Delete the document if a match is found

              await objectDoc.reference.delete();
              final imageref = storageRef.child(imageUrl);
              await imageref.delete();
              // Return after deletion or handle as needed
              showSnackbar(context,
                  "El artículo ha sido eliminado correctamente", green);

              return;
            }
          }
        }
      }
    }
  } catch (e) {
    showSnackbar(context, "El artículo no se ha eliminado", red);
  }
}

//borra varias imagenes en base a url
Future<void> deleteImageByImageUrlNoMessage(
    BuildContext context, String imageUrl) async {
  bool internet = await conexionInternt(context);

  if (internet == false) {
    return;
  }
  deleteImageByImageUrlNoMessageLogic(context, imageUrl);
}

Future<void> deleteImageByImageUrlNoMessageLogic(
    BuildContext context, String imageUrl) async {
  try {
    final storageRef = FirebaseStorage.instance.ref();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Reference to the user's "Users" collection
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      // Query for the user's document
      DocumentSnapshot userDocSnapshot =
          await usersCollection.doc(user.uid).get();

      if (userDocSnapshot.exists) {
        // Reference to the "Categories" subcollection within the user's document
        CollectionReference categoriesCollection =
            userDocSnapshot.reference.collection('Categories');

        // Query all category documents
        QuerySnapshot categoriesQuerySnapshot =
            await categoriesCollection.get();

        // Loop through the category documents
        for (final categoryDoc in categoriesQuerySnapshot.docs) {
          // Reference to the "Objects" subcollection within the category document
          CollectionReference objectsCollection =
              categoryDoc.reference.collection('Objects');

          // Query all documents within the "Objects" subcollection
          QuerySnapshot objectsQuerySnapshot = await objectsCollection.get();

          // Loop through the objects in the category
          for (final objectDoc in objectsQuerySnapshot.docs) {
            // Check if the image URL matches the desired URL
            if (objectDoc['Image_url'] == imageUrl) {
              // Delete the document if a match is found

              await objectDoc.reference.delete();
              final imageref = storageRef.child(imageUrl);
              await imageref.delete();
              // Return after deletion or handle as needed

              return;
            }
          }
        }
      }
    }
  } catch (e) {
    debugPrint("");
  }
}
