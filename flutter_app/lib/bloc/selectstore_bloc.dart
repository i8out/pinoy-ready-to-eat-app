import 'package:flutter/material.dart';

import 'package:flutter_app/pages/selectmeals.dart';
import 'package:flutter_app/repository/stores_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class SelectStoreBloc extends Bloc<SelectStoreEvent, SelectStoreState> {
  SelectStoreBloc();
  @override
  SelectStoreState get initialState => SelectStoreState();
  @override
  Stream<SelectStoreState> mapEventToState(SelectStoreEvent event) async* {
    if (event is GetStores) {
      yield PageLoading();
      try {
        final _stores = await GetStoresApi();
        yield DisplayPage(stores: _stores);
      } catch (e) {
        yield LoadError();
      }
    } else if (event is LoadMeals) {
      Navigator.push(
        event.context,
        MaterialPageRoute(builder: (context) => SelectMeals(event.color)),
      );
    }
  }
}
