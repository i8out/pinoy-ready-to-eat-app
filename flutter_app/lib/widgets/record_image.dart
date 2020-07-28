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
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.directions_bike,
                  color: Colors.white,
                  size: 16.0,
                ),
                Text(' Free',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
