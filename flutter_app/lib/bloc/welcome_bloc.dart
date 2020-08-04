import 'package:flutter_app/repository/welcome_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc();

  @override
  WelcomeState get initialState => WelcomeState();

  @override
  Stream<WelcomeState> mapEventToState(WelcomeEvent event) async* {
    yield DashboardLoading();
    if (event is StatusPressed) {
      try {
        final _items = await GetStatusApi();
        print(_items);
        yield ShowTransactions(
          showHistory: false,
          items: _items,
        );
      } catch (e) {
        yield DashboardError();
      }
    } else {
      try {
        final _items = await GetHistoryApi();
        print(_items);
        yield ShowTransactions(
          showHistory: true,
          items: _items,
        );
      } catch (e) {
        yield DashboardError();
      }
    }
  }
}
