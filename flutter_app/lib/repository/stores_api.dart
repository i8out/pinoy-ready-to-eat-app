import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_app/models/store.dart';

Future<List<Store>> GetStoresApi() async {
  await Future.delayed(Duration(seconds: 2));
  final _jsonString = await rootBundle.loadString('assets/data/stores.json');
  var _jsonObj = jsonDecode(_jsonString)['stores'] as List;
  var _stores = _jsonObj.map<Store>((j) => Store.fromJson(j)).toList();
  return _stores;
}
