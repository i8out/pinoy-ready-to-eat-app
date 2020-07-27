import 'package:flutter/services.dart';
import 'package:flutter_app/models/meal.dart';
import 'dart:convert';

Future<List<Meal>> GetMealsApi() async {
  await Future.delayed(Duration(seconds: 5));
  final _jsonString = await rootBundle.loadString('assets/data/meals.json');
  var _jsonObj = jsonDecode(_jsonString)['meals'] as List;
  var _meals = _jsonObj.map<Meal>((j) => Meal.fromJson(j)).toList();
  return _meals;
}
