class WelcomeState {
  final bool showHistory;
  WelcomeState({
    this.showHistory,
  });
}

class ShowHistory extends WelcomeState {
  final bool showHistory;
  ShowHistory({this.showHistory});
  @override
  String toString() => 'ShowHistory';

  @override
  List<Object> get props => [showHistory];
}
