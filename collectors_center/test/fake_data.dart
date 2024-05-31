// Simula los datos de la base de datos
import 'package:flutter/material.dart';

Map<String, dynamic> fakeCategoryData = {
  'Test Category': {
    'description': 'This is a test category description',
  }
};

Future<String> fetchDescriptions(String categoryName) async {
  await Future.delayed(const Duration(seconds: 1)); // Simula una espera de red
  return fakeCategoryData[categoryName]['description'] ?? '';
}

Future<void> editarDescripcion(
    BuildContext context, String categoryName, String newDescription) async {
  await Future.delayed(const Duration(seconds: 1)); // Simula una espera de red
  fakeCategoryData[categoryName]['description'] = newDescription;
}

Future<void> editarNombre(
    BuildContext context, String oldName, String newName) async {
  await Future.delayed(const Duration(seconds: 1)); // Simula una espera de red
  fakeCategoryData[newName] = fakeCategoryData.remove(oldName);
}

Future<void> eliminarCategoria(
    BuildContext context, String categoryName, bool confirmation) async {
  await Future.delayed(const Duration(seconds: 1)); // Simula una espera de red
  fakeCategoryData.remove(categoryName);
}

Future<void> eliminarDescripcion(
    BuildContext context, String categoryName) async {
  await Future.delayed(const Duration(seconds: 1)); // Simula una espera de red
  fakeCategoryData[categoryName]['description'] = '';
}
