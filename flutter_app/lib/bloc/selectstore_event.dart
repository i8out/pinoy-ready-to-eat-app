abstract class SelectStoreEvent {}

class GetStores extends SelectStoreEvent {
  @override
  String toString() => 'GetStores';
}
