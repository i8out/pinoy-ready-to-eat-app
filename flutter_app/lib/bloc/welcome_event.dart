abstract class WelcomeEvent {}

class HistoryPressed extends WelcomeEvent {
  @override
  String toString() => 'HistoryPressed';
}

class StatusPressed extends WelcomeEvent {
  @override
  String toString() => 'StatusPressed';
}