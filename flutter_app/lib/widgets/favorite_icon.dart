import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final String _rating;

  FavoriteIcon(
    this._rating,
  );

  @override
  Widget build(BuildContext context) {
    if (this._rating == '5') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,60,0),
            child: Icon(
              Icons.phone,
              size: 18.0,
            ),
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,60,0),
            child: Icon(
              Icons.phone,
              size: 18.0,
            ),
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
          Icon(
            Icons.favorite,
            color: Colors.pink,
            size: 18.0,
          ),
        ],
      );
    }
  }
}
