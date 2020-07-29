import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class FoodImage extends StatefulWidget {
  final String _photo;
  String _orderQty = '';

  FoodImage(
    this._photo,
  );

  @override
  State<StatefulWidget> createState() {
    return FoodImageState();
  }
}

class FoodImageState extends State<FoodImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          print('tapped' + widget._orderQty);
          if (widget._orderQty == '') {
            widget._orderQty = '0';
          }
          print('tapped 2' + widget._orderQty);
          var _orderMade = int.parse(widget._orderQty);
          _orderMade += 1;
          setState(() {
            widget._orderQty = _orderMade.toString();
          });
        },
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Image.memory(
              base64Decode(widget._photo),
              height: 100,
            ),
            Text(
              widget._orderQty,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
