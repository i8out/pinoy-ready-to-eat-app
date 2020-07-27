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
      child: Stack(
        children: <Widget>[
          Image.memory(
            base64Decode(_photo),
            height: 100,
          ),
          Center(
            child: Text(
              '0',
              style: Theme.of(context).textTheme.headline2,
            ),
          )
        ],
      ),
    );
  }
}
