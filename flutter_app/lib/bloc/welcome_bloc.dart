import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc();

  @override
  WelcomeState get initialState => WelcomeState();

//  final _historyItems = const [
//    '25 May 2020  Aling Nelia',
//    '24 May 2020  Aling Nelia',
//    '22 May 2020  Two Sisters',
//  ];
//  final _statusItems = const [
//    'No pending orders',
//    '',
//    '',
//  ];
  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    if (event is HistoryPressed) {
      yield ShowHistory(
        showHistory: true,
      );
    } else if (event is StatusPressed) {
      yield ShowHistory(
        showHistory: false,
      );
    } else {
      yield ShowHistory(
        showHistory: true,
      );
    }
  }
}
