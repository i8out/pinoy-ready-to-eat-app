import 'package:flutter_app/bloc/bloc.dart';
import 'package:flutter_app/repository/welcome_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BLoCTests', () {
    group('showDashboard', () {
      test('History items must have values', () async {
        var _bloc = WelcomeBloc();
        var _state = WelcomeState();
        _bloc.add(HistoryPressed());
        var _data = await GetHistoryApi();
        expect(_data.length > 0, true);
        if (_state is ShowTransactions) {
          expect(_bloc.state.showHistory, true);
        }
      });
      test('Status items must have values', () async {
        var _bloc = WelcomeBloc();
        var _state = WelcomeState();
        _bloc.add(StatusPressed());
        var _data = await GetStatusApi();
        expect(_data.length > 0, true);
        if (_state is ShowTransactions) {
          expect(_bloc.state.showHistory, false);
        }
      });
    });
  });
}
