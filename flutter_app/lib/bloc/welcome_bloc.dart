import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc();

  @override
  WelcomeState get initialState => WelcomeState();

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    if (event is HistoryPressed) {
      yield ShowHistory(showHistory:  true);
    } else if (event is StatusPressed) {
      yield ShowHistory(showHistory: false);
    } else {
      yield ShowHistory(showHistory: true);
    }
  }
}
