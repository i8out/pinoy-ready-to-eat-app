import 'package:flutter_app/models/store.dart';

class SelectStoreState {
  final List<Store> stores;
  SelectStoreState({
    this.stores,
  });
}

class PageLoading extends SelectStoreState {
  final List<Store> stores;
  PageLoading({this.stores});
  @override
  String toString() => 'PageLoading';

  @override
  List<Object> get props => [stores];
}

class DisplayPage extends SelectStoreState {
  final List<Store> stores;
  DisplayPage({
    this.stores,
  });
  @override
  String toString() => 'DisplayPage';

  @override
  List<Object> get props => [stores];
}

class LoadError extends SelectStoreState {
  final List<Store> stores;
  LoadError({this.stores});
  @override
  String toString() => 'LoadError';

  @override
  List<Object> get props => [stores];
}
