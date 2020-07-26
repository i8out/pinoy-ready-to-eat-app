import 'package:flutter/material.dart';
import 'dart:convert';

class RecordImage extends StatelessWidget {
  final String _photo;

  RecordImage(
      this._photo,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: new Image.memory(
        base64Decode(_photo),
        height: 100,
      ),
    );
  }
}