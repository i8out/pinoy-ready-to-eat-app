import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class FoodImage extends StatelessWidget {
  final String _photo;
  String _orderQty;

  FoodImage(
    this._photo,
    this._orderQty,
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
              _orderQty,
              style: GoogleFonts.lato(textStyle: Theme.of(context).textTheme.headline2),
            ),
          )
        ],
      ),
    );
  }
}
