import 'package:flutter/material.dart';

abstract class SelectStoreEvent {}

class GetStores extends SelectStoreEvent {
  @override
  String toString() => 'GetStores';
}

class LoadMeals extends SelectStoreEvent {
  BuildContext context;
  LoadMeals(this.context);
}
