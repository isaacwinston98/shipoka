import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {
  final String? imageVariable;

  SelectedImage({required this.imageVariable});

  @override
  Widget build(BuildContext context) {
    return imageVariable != null
        ? Image.asset(imageVariable!, fit: BoxFit.cover)
        : Icon(
      Icons.add,
      size: 50,
      color: Colors.grey,
    );
  }
}