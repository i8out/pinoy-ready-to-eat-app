import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/repository/meals_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/bloc/bloc.dart';

class SelectMealsBloc extends Bloc<SelectMealsEvent, SelectMealsState> {
  SelectMealsBloc();

  @override
  SelectMealsState get initialState => SelectMealsState();

  List<Meal> _meals;
  @override
  Stream<SelectMealsState> mapEventToState(SelectMealsEvent event) async* {
    if (event is GetMeals) {
      yield MealsLoading();
      try {
        _meals = await GetMealsApi();
        yield DisplayMeals(meals: _meals);
      } catch (e) {
        yield LoadMealsError();
      }
    }
  }
}
