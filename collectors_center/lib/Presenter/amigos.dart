//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//   Nombre:                          Tacos De Asada                                                        //
//   Fecha:                           15/11/23                                                              //
//   Descripción:                     Lógica detras del apartado de amigos como solicitudes y ver categorías//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<bool> eliminarSolicitud(String usuario) async {
  bool eliminada = false;

  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentReference userDocument =
          FirebaseFirestore.instance.collection('Users').doc(user.uid);

      CollectionReference requestsCollection =
          userDocument.collection('Requests');

      QuerySnapshot querySnapshot = await requestsCollection
          .where('user_request', isEqualTo: usuario)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        await requestsCollection.doc(querySnapshot.docs.first.id).delete();
        eliminada = true;
      }
    } else {
      eliminada = false;
    }
    return eliminada;
  } catch (e) {
    return eliminada;
  }
}

Future<bool> aceptarSolicitud(String usuario) async {
  bool aceptado = false;

  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      QuerySnapshot userQuerySnapshot = await usersCollection
          .where('User', isEqualTo: usuario)
          .limit(1)
          .get();

      if (userQuerySnapshot.docs.isNotEmpty) {
        DocumentReference currentUserDoc =
            userQuerySnapshot.docs.first.reference;

        CollectionReference requestsCollection =
            currentUserDoc.collection('Accepted');

        String actual = await obtenerUsuarioActual();
        QuerySnapshot querySnapshotrequest = await requestsCollection
            .where('user_accepted', isEqualTo: actual)
            .get();

        if (querySnapshotrequest.docs.isNotEmpty) {
          return false;
        }
        if (actual == usuario) {
          return false;
        }

        await requestsCollection.add({
          'user_accepted': actual,
          'timestamp': FieldValue.serverTimestamp(),
        });

        aceptado = true;
        aceptado = await eliminarSolicitud(usuario);
      }
    }
  } catch (e) {
    debugPrint('Error sending request: $e');
  }

  return aceptado;
}

Future<bool> rechazarSolicitud(String usuario) async {
  bool rechazado = false;
  rechazado = await eliminarSolicitud(usuario);
  return rechazado;
}

Future<String> obtenerUsuarioActual() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> userData = documentSnapshot.data()!;
      String username = userData['User'];
      return username;
    } else {
      return "";
    }
  } else {
    return "";
  }
}

Future<int> sendSolicitud(String usuario) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return 10; // User not authenticated
    }

    String actual = await obtenerUsuarioActual();

    if (actual == usuario) {
      return 2; // Can't send request to oneself
    }

    DocumentReference? currentUserDoc = await getUserDocument(usuario);
    if (currentUserDoc == null) {
      return 4; // User does not exist
    }

    bool alreadyFriends = await checkIfAlreadyFriends(actual, usuario);
    if (alreadyFriends) {
      return 0; // Already friends
    }

    bool requestSent = await checkIfRequestSent(currentUserDoc, actual);
    if (requestSent) {
      return 1; // Request already sent
    }

    await sendFriendRequest(currentUserDoc, actual);

    return 10; // Request sent successfully
  } catch (e) {
    return 3; // Error sending request
  }
}

Future<DocumentReference?> getUserDocument(String usuario) async {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  QuerySnapshot userQuerySnapshot =
      await usersCollection.where('User', isEqualTo: usuario).limit(1).get();

  if (userQuerySnapshot.docs.isNotEmpty) {
    return userQuerySnapshot.docs.first.reference;
  } else {
    return null;
  }
}

Future<bool> checkIfAlreadyFriends(String actual, String usuario) async {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Users');

  QuerySnapshot myuserQuerySnapshot =
      await usersCollection.where('User', isEqualTo: actual).limit(1).get();

  if (myuserQuerySnapshot.docs.isEmpty) {
    return false;
  }

  DocumentReference myUserDoc = myuserQuerySnapshot.docs.first.reference;

  CollectionReference myacceptedCollection = myUserDoc.collection("Accepted");

  QuerySnapshot querySnapshotaccepted = await myacceptedCollection
      .where("user_accepted", isEqualTo: usuario)
      .get();

  return querySnapshotaccepted.docs.isNotEmpty;
}

Future<bool> checkIfRequestSent(
    DocumentReference currentUserDoc, String actual) async {
  CollectionReference requestsCollection =
      currentUserDoc.collection('Requests');

  QuerySnapshot querySnapshotrequest =
      await requestsCollection.where('user_request', isEqualTo: actual).get();

  return querySnapshotrequest.docs.isNotEmpty;
}

Future<void> sendFriendRequest(
    DocumentReference currentUserDoc, String actual) async {
  CollectionReference requestsCollection =
      currentUserDoc.collection('Requests');

  await requestsCollection.add({
    'user_request': actual,
    'timestamp': FieldValue.serverTimestamp(),
  });
}

Future<List<String>> obtenerSolicitudes() async {
  List<String> solicitudes = [];
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Requests')
          .orderBy('timestamp', descending: false)
          .get();

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        String userRequest = document['user_request'] as String;

        solicitudes.add(userRequest);
      }
    }
  } catch (e) {
    debugPrint('Error fetching requests: $e');
  }
  return solicitudes;
}

Future<List<String>> obtenerAceptados() async {
  List<String> solicitudes = [];
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .collection('Accepted')
          .orderBy('timestamp', descending: false)
          .get();

      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        String userRequest = document['user_accepted'] as String;

        solicitudes.add(userRequest);
      }
    }
  } catch (e) {
    debugPrint('Error fetching requests: $e');
  }
  return solicitudes;
}

Future<List<String>> obtenerCategoriasAmigos(String usuario) async {
  List<String> categories = [];
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('Users');

      QuerySnapshot userQuerySnapshot = await usersCollection
          .where('User', isEqualTo: usuario)
          .limit(1)
          .get();

      if (userQuerySnapshot.docs.isNotEmpty) {
        DocumentReference amigoDoc = userQuerySnapshot.docs.first.reference;

        CollectionReference categoriasCollection =
            amigoDoc.collection("Categories");

        QuerySnapshot categoriasSnapshot = await categoriasCollection
            .orderBy('timestamp', descending: false)
            .get();

        for (QueryDocumentSnapshot document in categoriasSnapshot.docs) {
          String categoryName = document['Name'] as String;
          categories.add(categoryName);
        }
      }
    }
  } catch (e) {
    debugPrint("Error fetching categories: $e");
  }
  return categories;
}

Future<List<Map<String, dynamic>>> obtenerObjetosCategoriasAmigos(
    String usuario, String categoryName) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user = auth.currentUser;
  if (user != null) {
    try {
      CollectionReference usersCollection = firestore.collection('Users');
      QuerySnapshot userQuerySnapshot = await usersCollection
          .where('User', isEqualTo: usuario)
          .limit(1)
          .get();

      if (userQuerySnapshot.docs.isNotEmpty) {
        DocumentReference userDoc = userQuerySnapshot.docs.first.reference;
        CollectionReference categoriasCollection =
            userDoc.collection('Categories');

        QuerySnapshot categoriasQuery = await categoriasCollection
            .where('Name', isEqualTo: categoryName)
            .get();

        if (categoriasQuery.docs.isNotEmpty) {
          DocumentReference categoriesDoc =
              categoriasQuery.docs.first.reference;
          CollectionReference objectsCollection =
              categoriesDoc.collection("Objects");

          QuerySnapshot objectsQuery = await objectsCollection.get();

          List<Map<String, dynamic>> objectList = [];
          for (QueryDocumentSnapshot doc in objectsQuery.docs) {
            Map<String, dynamic> objectData =
                doc.data() as Map<String, dynamic>;
            String name = objectData['Name'];
            String imageUrl = objectData['Image_url'];
            String description = objectData['Description'];

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
      }
    } catch (e) {
      debugPrint("error $e");
    }
  }

  // User not logged in or other error
  return [];
}
