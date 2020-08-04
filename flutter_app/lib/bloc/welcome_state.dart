class WelcomeState {
  final bool showHistory;
  List<String> items;
  WelcomeState({
    this.showHistory,
    this.items,
  });
}

class DashboardLoading extends WelcomeState {
  final bool showHistory;
  DashboardLoading({
    this.showHistory,
  });
  @override
  String toString() => 'DashboardLoading';

  @override
  List<Object> get props => [showHistory];
}

class ShowTransactions extends WelcomeState {
  final bool showHistory;
  List<String> items;
  ShowTransactions({
    this.showHistory,
    this.items,
  });
  @override
  String toString() => 'ShowTransactions';

  @override
  List<Object> get props => [
        showHistory,
        items,
      ];
}

class DashboardError extends WelcomeState {
  final bool showHistory;

  DashboardError({
    this.showHistory,
  });
  @override
  String toString() => 'DashboardError';

  @override
  List<Object> get props => [showHistory];
}
