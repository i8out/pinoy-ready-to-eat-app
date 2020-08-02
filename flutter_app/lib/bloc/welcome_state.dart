class WelcomeState {
  final bool showHistory;
  List<String> items;
  WelcomeState({
    this.showHistory,
    this.items,
  });
}

class ShowHistory extends WelcomeState {
  final bool showHistory;

  ShowHistory({
    this.showHistory,

  });
  @override
  String toString() => 'ShowHistory';

  @override
  List<Object> get props => [showHistory];
}
