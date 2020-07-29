import 'package:flutter/material.dart';

class MealPrice extends StatelessWidget {
  final String _price;

  MealPrice(
    this._price,
  );
  @override
  Widget build(BuildContext context) {
    return Text(
      'P' + _price,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
