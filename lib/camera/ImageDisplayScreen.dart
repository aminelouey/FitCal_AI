import 'dart:io';

import 'package:flutter/material.dart';

class ImageDisplayScreen extends StatelessWidget {
  final String imagePath;

  ImageDisplayScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return imagePath.isNotEmpty
        ? Image.file(File(imagePath)) // Affichage de l’image sélectionnée
        : const Text("Aucune image sélectionnée");
  }
}
