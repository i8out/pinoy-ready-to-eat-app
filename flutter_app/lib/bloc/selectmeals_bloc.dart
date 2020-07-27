import 'package:flutter_app/repository/meals_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class SelectMealsBloc extends Bloc<SelectMealsEvent, SelectMealsState> {
  SelectMealsBloc();
  @override
  SelectMealsState get initialState => SelectMealsState();
  @override
  Stream<SelectMealsState> mapEventToState(SelectMealsEvent event) async* {
    if (event is GetMeals) {
      yield MealsLoading();
      try {
        final _meals = await GetMealsApi();
        yield DisplayMeals(meals: _meals);
      } catch (e) {
        yield LoadMealsError();
      }
    }
  }
}
