import 'package:flutter/material.dart';

class MealName extends StatelessWidget {
  final String _meal;
  final String _color;

  MealName(
    this._meal,
    this._color,
  );

  Color mapColors(String dataColor) {
    Color setColor;
    switch (dataColor) {
      case '0xFFFFF9C4':
        {
          setColor = const Color(0xFFFFA726);
        }
        break;
      case '0xFFFFCDD2':
        {
          setColor = const Color(0xFFEF5350);
        }
        break;
      case '0xFFB2DFDB':
        {
          setColor = const Color(0xFF66BB6A);
        }
        break;
      case '0xFFB3E5FC':
        {
          setColor = const Color(0xFF42A5F5);
        }
        break;
      default:
        {
          setColor = const Color(0xFF42A5F5);
        }
        break;
    }
    return setColor;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _meal,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: mapColors(this._color),
      ),
    );
  }
}
